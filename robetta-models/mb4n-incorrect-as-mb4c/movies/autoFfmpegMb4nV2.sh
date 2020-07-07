#!/usr/bin/env bash
# file: autoFfmpegMb4nV2.sh
# author: Jon David
# date: Friday, June 19, 2020
# description:
#   Uses  FFMPEG to create movie from a collection of PNG files.
# notes:
#   ffmpeg
#     -framerate 30    ## input frame rate
#     -i image%03d.png ## image names (e.g. myMovieMb4nV1000.png, *1001.png, etc.)
#     -s:v 640x640     ## Instagram video size
#     -c:v libx264     ## encoder
#     -profile:v main  ## H.264 profile for video
#     -crf 12          ## constant rate factor (0 to 23, 0 is lossless)
#     -pix_fmt yuv420p ## pixel format--changes the rgb from the pngs to yuv
#     -preset veryslow ## encoding speed (slow but higher quality per file size)
#     -tune stillimage ## tunes the encoding settings for images
#     -r 30            ## output frame rate
#     output_file.mp4  ## movie file name
# parameters from...
#   dgoppenheimer.github.io.oppenheimer-blog/2017/02/25/small-molecule-movies-in-pymol/

ffmpeg -framerate 30 -pattern_type glob -i '*.png' -s:v 640x640 -c:v libx264 -profile:v main -crf 12 -tune stillimage -pix_fmt yuv420p -preset veryslow -r 30 MyMovMb4nV2.mp4

