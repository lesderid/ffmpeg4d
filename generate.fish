#!/usr/bin/fish

rm -rf source/ffmpeg/; and mkdir -p source/ffmpeg

echo -e "module ffmpeg;\n" > source/ffmpeg/package.d

for dir in c/lib*
    set lib (basename $dir)
    set module ffmpeg.$lib
    set outputdir source/ffmpeg/$lib
    mkdir -p $outputdir

    set files (find $dir -type f | grep -v version)

    set output (if test (count $files) -lt 2; echo $outputdir/(basename -s .h $files[1]).d; else; echo source/ffmpeg/; end)
    dstep $files --package $module --output $output --global-attribute='import ffmpeg; @nogc nothrow' --collision-action=ignore

    set wrongdir source/ffmpeg/c/$lib
    if test -d $wrongdir
        mv source/ffmpeg/c/$lib/* $outputdir
        rmdir source/ffmpeg/c/$lib
    end

    set packagefile $outputdir/package.d
    echo -e "module $module;\n" > $packagefile
    for file in $outputdir/*
        if test (basename $file) = "package.d"
            continue
        end

        set submodule $module.(basename -s .d $file)
        echo "public import $submodule;" >> $packagefile
    end

    echo "public import $module;" >> source/ffmpeg/package.d
end

rm -df source/ffmpeg/c

sed -i 's/\([0-9]U\?L\)L/\1/' **.d
sed -i 's/enum \([a-z]\+[^=]*=.*;\)/alias \1/' **.d
sed -i 's/va_list/char*/g' **.d

sed -i 's/= AV_PIX_FMT_NE(\([^,]*\),\s*\([^)]*\))/= AVPixelFormat.AV_PIX_FMT_\2/' **.d
sed -i 's/enum FF_CEIL_RSHIFT = AV_CEIL_RSHIFT;/alias FF_CEIL_RSHIFT = AV_CEIL_RSHIFT;/' **.d

sed -i '/builtin_constant_p/d' **.d
