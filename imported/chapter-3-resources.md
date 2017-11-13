---
id: 82
title: Chapter 3 Resources
date: 2013-04-17T14:09:48+00:00
author: monks
layout: page
guid: http://mocg.wordpress.com/?page_id=82
---
<p style="text-align:right;">
  <a title="Chapter 2 Resources" href="http://mocg.wordpress.com/chapter-2-resources/">< Back to Chapter 2 Resources</a> | <a title="Chapter 4 Resources" href="http://mocg.wordpress.com/chapter-4-resources/">Go to Chapter 4 Resources ></a>
</p>

This page contains links to all resources mentioned in Chapter 3 of the textbook.

### Bouncing ball movie

Shows the value of scalings for deforming an object. At the moment of the bounce, the ball is briefly deformed to be flatter and wider, as balls do when they bounce. This simple animation was created with POV-Ray, the raytracing engine used for projects in the textbook.

[youtube=http://www.youtube.com/watch?v=y2Ee-I34C3w]

### [An interactive webpage on 2D Affine Transformations](https://nathancarter.github.io/scene2d)

This web page was created by the textbook author to correspond to several exercises in the chapter, most notably those involving scene construction and the runner, cap, and ball shapes.

Warning:

  * It has been tested on Google Chrome and Mozilla Firefox browsers, but not others. In particular, no guarantee is made that it will function on Microsoft Internet Explorer.

### [Glyphic Technologies' Affine Transformations Applet](http://www.glyphic.com/transform/applet/4app.html)

A Java applet for experimenting with 2D affine transformations

Warnings:

  * Its rotations are clockwise, whereas I use the much more common convention that rotations are counterclockwise. So _R_<sub>30°</sub> can be done in the applet by using -30° instead.
  * Its _y_-axis is upside-down. This is common in computer applications, but the textbook uses the mathematical convention you're probably familiar with from middle school. For us, the positive _y_ axis points up. So to see _T_<sub>4,5</sub> in the applet, you would have to use _T_<sub>4,-5</sub> instead.
  * Its units are very small. _T_<sub>4,5</sub> will not move the object very much at all. Something more like _T_<sub>40,50</sub> will be clearly visible.

### [Brown University Exploratories' Transformation Game](http://www.cs.brown.edu/exploratories/freeSoftware/repository/edu/brown/cs/exploratories/applets/transformationGame/transformation_game_java_plugin.html)

Another Java applet that turns affine transformations into a puzzle game

How to play:

  * Try to transform the house at the origin onto the darker copy.
  * Drag a red transformation block from the right down to the backwards pacman beneath the affine plane.
  * After doing so, click and drag on the house to manipulate the parameter.
  * E.g., place a translation, then drag to show how much to translate and in what direction. Or place a rotation, then drag to show how much to rotate.
  * In this game, translations are either in _x_ or in _y_ but not both.