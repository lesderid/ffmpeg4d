/*
 * Copyright (c) 2016 Neil Birkbeck <neil.birkbeck@gmail.com>
 *
 * This file is part of FFmpeg.
 *
 * FFmpeg is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2.1 of the License, or (at your option) any later version.
 *
 * FFmpeg is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with FFmpeg; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA
 */

module ffmpeg.libavutil.mastering_display_metadata;

import ffmpeg.libavutil.frame;
import ffmpeg.libavutil.rational;

extern (C):
import ffmpeg; @nogc nothrow:

/**
 * Mastering display metadata capable of representing the color volume of
 * the display used to master the content (SMPTE 2086:2014).
 *
 * To be used as payload of a AVFrameSideData or AVPacketSideData with the
 * appropriate type.
 *
 * @note The struct should be allocated with av_mastering_display_metadata_alloc()
 *       and its size is not a part of the public ABI.
 */
struct AVMasteringDisplayMetadata
{
    /**
     * CIE 1931 xy chromaticity coords of color primaries (r, g, b order).
     */
    AVRational[2][3] display_primaries;

    /**
     * CIE 1931 xy chromaticity coords of white point.
     */
    AVRational[2] white_point;

    /**
     * Min luminance of mastering display (cd/m^2).
     */
    AVRational min_luminance;

    /**
     * Max luminance of mastering display (cd/m^2).
     */
    AVRational max_luminance;

    /**
     * Flag indicating whether the display primaries (and white point) are set.
     */
    int has_primaries;

    /**
     * Flag indicating whether the luminance (min_ and max_) have been set.
     */
    int has_luminance;
}

/**
 * Allocate an AVMasteringDisplayMetadata structure and set its fields to
 * default values. The resulting struct can be freed using av_freep().
 *
 * @return An AVMasteringDisplayMetadata filled with default values or NULL
 *         on failure.
 */
AVMasteringDisplayMetadata* av_mastering_display_metadata_alloc ();

/**
 * Allocate a complete AVMasteringDisplayMetadata and add it to the frame.
 *
 * @param frame The frame which side data is added to.
 *
 * @return The AVMasteringDisplayMetadata structure to be filled by caller.
 */
AVMasteringDisplayMetadata* av_mastering_display_metadata_create_side_data (AVFrame* frame);

/**
 * Content light level needed by to transmit HDR over HDMI (CTA-861.3).
 *
 * To be used as payload of a AVFrameSideData or AVPacketSideData with the
 * appropriate type.
 *
 * @note The struct should be allocated with av_content_light_metadata_alloc()
 *       and its size is not a part of the public ABI.
 */
struct AVContentLightMetadata
{
    /**
     * Max content light level (cd/m^2).
     */
    uint MaxCLL;

    /**
     * Max average light level per frame (cd/m^2).
     */
    uint MaxFALL;
}

/**
 * Allocate an AVContentLightMetadata structure and set its fields to
 * default values. The resulting struct can be freed using av_freep().
 *
 * @return An AVContentLightMetadata filled with default values or NULL
 *         on failure.
 */
AVContentLightMetadata* av_content_light_metadata_alloc (size_t* size);

/**
 * Allocate a complete AVContentLightMetadata and add it to the frame.
 *
 * @param frame The frame which side data is added to.
 *
 * @return The AVContentLightMetadata structure to be filled by caller.
 */
AVContentLightMetadata* av_content_light_metadata_create_side_data (AVFrame* frame);

/* AVUTIL_MASTERING_DISPLAY_METADATA_H */
