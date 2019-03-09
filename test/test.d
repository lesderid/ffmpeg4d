import std.stdio;
import std.conv;

unittest
{
    import ffmpeg;

    av_register_all();

    stderr.writeln("libavcodec build configuration: ", avcodec_configuration.to!string);
    stderr.writeln("libavdevice build configuration: ", avdevice_configuration.to!string);
    stderr.writeln("libavfilter build configuration: ", avfilter_configuration.to!string);
    stderr.writeln("libavformat build configuration: ", avformat_configuration.to!string);
    stderr.writeln("libavutil build configuration: ", avutil_configuration.to!string);

    stderr.writeln("libpostproc build configuration: ", postproc_configuration.to!string);
    stderr.writeln("libswresample build configuration: ", swresample_configuration.to!string);
    stderr.writeln("libswscale build configuration: ", swscale_configuration.to!string);
}
