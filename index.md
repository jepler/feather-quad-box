---
layout: base
title: Feather Quad 2x2 Enclosure
---
This is an enclosure for the [Adafruit Quad 2x2
FeatherWing](https://www.adafruit.com/product/4253).
It is designed to accomodate a stack of 3 boards with regular height headers,
but you can easily change the height by editing the OpenSCAD file and regenerating it.

{% for asset in site.data.assets %}
  {% assign stlbasename = asset.stl | split: "/" | last | split: "." | first %}
### {{ asset.name }}

<html>
{% for image in asset.images %}
{% assign basename = image | split: "/" | last | split: "." | first %}
{% if basename == stlbasename %}
<img src="{{ relative }}resources/{{ image }}" title="{{ asset.name }}" data-stl="{{ relative }}resources/{{ asset.stl }}">
{% else %}
<img src="{{ relative }}resources/{{ image }}" title="{{ asset.name }}">
{% endif %}
{% endfor %}
</html>

{% endfor %}

{% comment %}
Sections to consider adding:
## Remixed from
## How I made this
{% endcomment %}


## Print Settings
Designed for 0.4mm extrusion width.  Overall, this is a very forgiving print.
However, a manually added support under the opening for the USB plug won't hurt.

## Parts I used in my clock
For my clock design, I placed [4 displays in
front](https://www.adafruit.com/product/2965), the Quad in the middle, [a
Feather M4 Experss](https://www.adafruit.com/product/3857) and [precision RTC
FeatherWing](https://www.adafruit.com/product/3028) in back.  I also put a
[small lipo battery](https://www.adafruit.com/product/3898) inside so the
display would continue to run during short power outages.  Then I used a whole
pile of [M2.5 screws (5mm are good) and 12mm
spacers](https://www.adafruit.com/product/3299) to put it together.

While I haven't put the clock code online, there's a series on my personal blog
about some of the surrounding work that went into it:
 * [Quad CharliePlex FeatherWing hack](https://emergent.unpythonic.net/01595078470)
 * [Minimal Time-Zone Handling for CircuitPython](https://emergent.unpythonic.net/01595021837)
 * [Calibrating the DS3231 and PFC8523 RTCs](https://emergent.unpythonic.net/01594923755)
 * [Helpful scripts for CircuitPython & Real Time Clocks (RTCs)](https://emergent.unpythonic.net/01594912346)


## Downloads

{% for asset in site.data.assets %}
### {{ asset.name }}:

{{ asset.notes }}

{% if asset.flags %} 
STL generated with `{{ asset.flags }}`
{% endif %}

{% if asset.scad %}
{% assign basename = asset.scad | split: "/" | last %}
  - [{{ basename }}](resources/{{ asset.scad }})
{% endif %}
{% if asset.stl %} 
  {% assign basename = asset.stl | split: "/" | last %}
  - [{{ basename }}](resources/{{ asset.stl }})
  {% endif %}
{% if asset.svg %} 
  {% assign basename = asset.svg | split: "/" | last %}
  - [{{ basename }}](resources/{{ asset.svg }})
  {% endif %}
{% for download in asset.downloads %}
  {% assign basename = download | split: "/" | last %}
  - [{{ basename }}](resources/{{ download }})
{% endfor %}
{% endfor %}



