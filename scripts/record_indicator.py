#!/usr/bin/env python3

import pathlib
import subprocess

import pystray
from PIL import Image, ImageDraw

SCRIPT = str(pathlib.Path(__file__).with_name("screencast.sh"))


def create_icon():
    image = Image.new("RGBA", (32, 32), (0, 0, 0, 0))
    draw = ImageDraw.Draw(image)
    draw.ellipse((1, 1, 31, 31), fill=(255, 0, 0, 255))
    return image


def stop_recording(icon, item):
    subprocess.Popen([SCRIPT, "stop"])
    icon.stop()


icon = pystray.Icon(
    "wf-recorder",
    create_icon(),
    "Screen recording",
    menu=pystray.Menu(
        pystray.MenuItem("Stop recording", stop_recording, default=True),
    ),
)

icon.run()
