
This page contains links to all resources mentioned in Chapter 10 of the
textbook. It begins with several ways to graph vector functions for free on
the web, and concludes with how to graph them within POV-Ray scenes.  As a
quick comparison, the first two methods require Java, while the third does
not; but consequently the first two are interactive, while the third
produces only a static image.

## [CalcPlot3D](http://web.monroecc.edu/manila/webfiles/calcNSF/JavaCode/CalcPlot3D.htm)

A useful tool for graphing vector functions and other kinds of 3D objects.
Although this applet was created for use in calculus classes, it is useful
to us as well.  Use the following procedure to graph a vector function in
CalcPlot3D.

  1. Erase the default shape that appears, by unchecking the box next to
     Function 1 and clicking the Graph button immediately above it.
  2. Add a parametric curve by clicking the Graph menu and choosing Add a
     Space Curve.
  3. In the three blanks provided, enter the $x$, $y$, and $z$ components
     of the vector function, using $t$ as the parameter. The default bounds
     for $t$ (from $-10$ to $10$) may be sensible for your function, but you
     can change them.
  4. Click Graph (on the popup window into which you typed the parametric
     equations).
  5. Click and drag to view from different angles.

## [Sage](http://www.sagemath.org)

A powerful mathematics tool that you can use on your own computer or on the
web.  [Here is a link to a webpage that evaluates Sage
code](http://aleph.sagemath.org) and shows you the result immediately.  Type
in code like the following to graph a vector function.  (Replace the three
components of the vector function with any three vector function
components.)  The $0$ and $2\pi$ are the bounds on $t$.

```sage
var('t')
parametric_plot3d([cos(t),sin(t),t],(0,2*pi))
```

To see that example plotted, [click here](http://aleph.sagemath.org/?z=eJwrSyzSUC9R1-TlKkgsSsxNLSnKTI4vyMkvMU7RiE7OL9Yo0dQpzswDUSWxOhoGOkZaBZmamgD6qRFN&lang=sage).

## [Wolfram|Alpha](http://www.wolframalpha.com)

Like Sage, this online math tool does far more than just graphing vector
functions, but we can use it for that, too.  In the input box, type input
like the following.

```
parametric plot (t*cos t, t*sin t,t), t=0..6pi
```

To see that example plotted, [click
here](http://www.wolframalpha.com/input/?i=parametric+plot+%28t*cos+t%2C+t*sin+t%2Ct%29%2C+t%3D0..6pi).

## Graphing vector functions in POV

Download this file by clicking
[vector-functions.inc](files/vector-functions.inc). Instructions for using
it appear in the textbook, and you can download
[vector-demo.pov](files/vector-demo.pov) to see how I have used it in a
demo.

## Review of Derivatives

If it's been awhile since you've had differential calculus (what many
colleges call "Calculus I") then here are some online review resources
available to you.  There are a great many, and this is just a selection.

  * Reference sheets
      * [Derivative rules
        only](http://math.arizona.edu/~calc/Rules.pdf) (top half of the
        page)
      * [Derivative rules and related
        strategies](http://tutorial.math.lamar.edu/pdf/Calculus_Cheat_Sheet_Derivatives.pdf)
        (only portions of the first page or two are relevant for our study)
  * Selected video lectures from Khan Academy
      * [The power
        rule](https://www.khanacademy.org/math/calculus/differential-calculus/power_rule_tutorial/v/power-rule)
      * [Trigonometry, exponentials, and
        logarithms](https://www.khanacademy.org/math/calculus/differential-calculus/chain_rule/v/derivatives-of-sin-x--cos-x--tan-x--e-x-and-ln-x)
      * [The product
        rule](https://www.khanacademy.org/math/calculus/differential-calculus/product_rule/v/applying-the-product-rule-for-derivatives)
      * [The quotient
        rule](https://www.khanacademy.org/math/calculus/differential-calculus/product_rule/v/quotient-rule-for-derivative-of-tan-x)
      * [The chain
        rule](https://www.khanacademy.org/math/calculus/differential-calculus/chain_rule/v/chain-rule-definition-and-example)
