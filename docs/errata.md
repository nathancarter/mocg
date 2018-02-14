
# Errata

This page lists known errors in the text, which will be fixed in
future versions.  Thanks to those who reported errors, especially
Larry Riddle of Agnes Scott College, who did a very thorough
proofreading and is responsible for most of this list.

## Chapter 4

### Page 95

Line 2: The word "into" is repeated twice.

Exercise 4.37 says "the while loop structure" when it should say
"the `for` loop structure."

## Chapter 5

### Page 127

The first sentence of Exercise 5.23 says "any linear function,"
but it should say "any affine transformation of the plane."  This
is not relevant until part (e).

### Page 156

Exercise 6.36 should not say "rotates the object about an
arbitrary line in space," but rather "performs an ordinary POV
rotation transformation centered on an arbitrary point in space."
Then the example given makes more sense, and the exercise is less
complex.

## POV Break C

### Page 159

The code block on this page is missing some curly brackets.  The
correct code block is shown here.

```povray
union {
  sphere { <-0.5,0,0>, 0.25 } // forms the left end cap of the pill
  sphere { < 0.5,0,0>, 0.25 } // forms the right end cap of the pill
  cylinder { <-0.5,0,0>, <0.5,0,0>, 0.25 } // the middle section
  pigment { color Wheat } // a predefined color, almost White
}
```

### Page 166

The code block on this page is missing some affine transformations
of the Doorstop.  The correct code block is shown here; only the
first two lines of the difference block have been changed.

```povray
#declare Cheese = difference {
  // Start with the doorstop defined earlier, repositioned:
  object { Doorstop scale 2.6 translate <-0.5,-0.35,1> }
  // Remove all of these objects to make holes:
  sphere { <0,-0.5,0>, 0.2 }
  sphere { <-0.75,-0.25,1.25>, 0.4 }
  sphere { <-0.8,-1,-0.3>, 0.3 }
  sphere { <-1.75,0.2,0.5>, 0.2 }
  sphere { <0.7,-1.1,1>, 0.3 }
  // Change its color to yellow:
  pigment { color BrightGold }
}
```

## Chapter 7

### Page 191

The first sentence of Exercise 7.14, as well as parts (a) and (b)
should be referencing Exercise 7.13, not Exercise 7.10.

### Page 192

In order for Exercises 7.17 and 7.18 to be consistent, we should
alter Exercise 7.17 as follows.

In part (b), the cylinder endpoint $(0,h,0)$ should be $(0,0,h)$.

In part (e), the cone endpoint $(0,h,0)$ should be $(0,0,h)$.

### Page 194

The cylinder in the center of Figure 7.16 has the wrong equations
below it.  They should read:
<center>
    $x^2-z^2=\frac12$<br>
    $x^2-z^2-\frac12=0$<br>
    `x*x-z*z-0.5`
</center>

## Chapter 8

### Page 209

In Exercise 8.10, parts (b) and \(c) were written incorrectly.
They should be replaced with the following.

(b) To combine two RGB colors subtractively, first compute their
CMY equivalents, combine them additively, and then convert the
result back to an RGB vector.  Redo each vector combination in
Exercise 8.1, but this time use the procedure just described to
combine them subtractively.

\(c) Create a formula (the analog of (8.1)) for the subtractive
combination of two RGB color vectors $\langle r_1,g_1,b_1\rangle$
and $\langle r_2,g_2,b_2\rangle$.

### Page 210

Exercise 8.13 should also contain this sentence:  Assume in each
case that $\langle h,1,1 \rangle$ corresponds to the RGB vector
$\langle r,g,b \rangle$ and write your answers in terms of
$r$, $g$, $b$, and $p$.

## Chapter 10

### Page 268

The equations above the graphs in Figure 10.7 should be
$y=h_2(x)$ (for the left graph) and $y=h_3(x)$ (for the right
graph).

### Page 297

In Exercise 10.26, the hint is given to use the `#debug` command.
However, that command does not display its messages in the POV-Ray
Messages window.  So use the `#warning` command instead, which
functions the same as `#debug`, but directs its messages to the
POV-Ray Messages window, where you can see them.

## Chapter 11

### Page 299

The code block in Exercise 11.26 erroneously uses the POV reserved
word `end` as a variable.  Another choice should have been made,
such as `stop`:

```povray
  LinearPath(start,stop,rad)
```

## Chapter 12

### Page 336

In Exercise 12.29, the formula $b_{i,n}(t)$ should be written
instead as $b_{n,i}(t)$, to be consistent with the notation in
later chapters.

