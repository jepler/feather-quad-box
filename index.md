---
layout: base
title: feather-quad-box
---
This is an enclosure for the [Adafruit Quad 2x2
FeatherWing](https://www.adafruit.com/product/4253).
It is designed to accomodate a stack of 3 boards with regular height headers,
but you can easily change the height by editing the OpenSCAD file and regenerating it.

For my clock design, I placed displays in front, the Quad in the middle, and
Feather and RTC FeatherWing in back.

You'll need a whole pile of M2.5 screws (5mm are good) and 12mm spacers
to put it together.

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
This is a very forgiving print.  However, a manually added support under the
opening for the USB plug won't hurt.

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



