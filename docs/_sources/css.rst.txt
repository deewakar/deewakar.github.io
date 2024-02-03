=====================
Cascading Style Sheet
=====================

.. raw:: org

   #+FILETAGS: css:programming:wiki

.. raw:: org

   #+STARTUP: inlineimages 

Online resources to learn css (beginner)
========================================

-  https://developer.mozilla.org/en-US/docs/Learn/CSS/
-  https://htmldog.com/guides/
-  https://web.dev/learn/css/
-  http://learnlayout.com/
-  https://adamschwartz.co/magic-of-css/
-  https://css-tricks.com/snippets/css/a-guide-to-flexbox/
-  https://css-tricks.com/snippets/css/complete-guide-grid/
-  https://cssbattle.dev/battle/
-  https://cssgridgarden.com/
-  https://cssgridgarden.com/

Basics
======

.. code:: css

   html {
       font-size: 14px;
       color: navy;
   }

-  A css rule contains a selector followed by several css declarations
   inside curly braces, e.g. above 'html' is the selector
-  Each lines inside the curly braces are called css declarations, they
   are of the form 'property:value'
-  Sometimes a function like calc() may be used instead of a literal
   value at the right-hand side of a css declaration
-  Another structure used in css is the css at-rule structure that
   provides instruction for what css should do or how to behave
-  @media is used for media queries, @import is used to import a
   stylesheet into another stylesheet etc.
-  CSS properties comes in two forms: long form and shorthands
-  Shorthands set several properties in a single line, some examples of
   shorthand properties are: font,background,padding,margin,border

Cascade and Inheritance
=======================

Cascade : in case of conflicting selection, the css rule that appears later will be applied, hence order of the css rules matter
--------------------------------------------------------------------------------------------------------------------------------

.. code:: css

   p {
       font-size: 14px;
   }
   /* this rule will be applied */
   p {
       font-size: 2rem;
   }

When more rule can style an element, then cascade determines which rule will be applied
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

It depends on following three factors listed here in incresing order of priority (later ones overrule earlier ones): source order, specificity, importance
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

source order : means the order of the conflicting css rules in the css file(s), the later ones overrule earlier rules.
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Specificity : Some selectors are considered more specific than others e.g. id selector is more specific than class selector which is more specific than element selector
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Styles with higher specificity overides the ones with lower specificity
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Only the conflicting css declarations are replaced rather than entire rulesets.
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

The browser gives certain scores to different selectors by adding which the total specificity score is calculated.
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Specificity of a selector is measued using four different values (four single digit columns): Thousands, Hundrends, Tens and Ones
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

The inline styles give 1 to the Thousands, id selector scores 1 in hundereds column, class, pseudo-class and attribute score in Tens column, and element,pseudo-elements score in ones column
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

e.g. the selector 'h1 + p::first-letter' has total specificity score of 3
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Importance: We can use a special keyword '!important' to overrule all calculations about cascade and specificity (NEVER USE THIS ACTUALLY!!)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Inheritance: Some CSS properties set on parent elements are inherited by child elements for e.g. color, font-family and some aren't for e.g. width.
---------------------------------------------------------------------------------------------------------------------------------------------------

CSS provides five special universal values to control inheritance: inherit, initial, revert, revert-layer and unset
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

A shorthand property 'all' can be used to set these inheritance values for all properties of an element at once
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

CSS Selection
=============

Basic CSS Selectors
-------------------

The simplest of selectors are the type selectors that uses html element names themselves: html,body,p,div,a etc.,
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Class selectors have '.' at the start followed by the class name, id selectors have '#' at the start followed by the id name
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

We can target multiple selectors by using a comma between them
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. code:: css

   li,p {
       font-size: 14px;
       color: red;
   }

Element tag selector immediately followed by a class selector selects all the elements with the specified class only.
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. code:: css

   li.special {
       color: purple;
   }

The universal selector '\*' will match elements of any type in the document or inside parent element when chained with another selector with a descendant combinator.
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

CSS Combinators
---------------

To select nested element inside another element (i.e. descendant element), we use a selector called descendant combinator that uses space to separate the enclosing selector and the enclosed selector
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. code:: css

   /* only select <em> elements enclosed inside <li> elements */
   li em {
       font-size: 14px;
   }

We use adjacent sibling combinator '+' to select element that is immediately after the specified element on the same hierarchy level
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. code:: css

   h1 + p {
       font-size: 200%;
   }

The general sibling selector (~) selects all the siblings of the specified element
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. code:: css

   h1 ~ p {
       font-family: Serif;
   }

The child selector (>) selects all the children (immediate descendants) of the specified element
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. code:: css

   /* all child <p> elements of a div will be selected */
   div > p {
       font-size: 4em;
   }

Attribute Selectors
-------------------

Attribute selectors enable us to select elements based on the presence of an attribute alone or along with its value.
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

syntax: [attr], e.g. a[title] selects all <a> elements with an attribute named 'title'
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

syntax: [attr=value], e.g. a[href="http://example.com"] selects all <a> elements with href attribute having value the string "http://example.com"
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

syntax: [attr~=value], e.g. p[class~="special"] matches <p> elements with class attribute exactly the string "special" or if the classlist contains 'special'
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

syntax: [attr|=value], e.g. div[lang="zh"] matches <div> elements with lang attribute exactly the string "zh" or starts with "zh" and a hyphen (-)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

syntax: [attr^=value], e.g. li[class^="box-"] matches <li> elements with classlist beginning with "box-"
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

syntax: [attr$=value], e.g. li[class$="-box"] matches <li> elements with classlist ending in "-box"
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

syntax: [attr*=value], e.g. li[class*="box"] matches <li> elements with classlist containing the sting "box"
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

to ignore the case sensitivity of the attributes matches we can put the value i before the closing bracket e.g. li[class^="button-" i]
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Pseudo Classes and Pseudo Elements
----------------------------------

Pseudo classes are used to style certain states of an element, for example, :hover pseudo class is used to select an element only when it is hovered over by the mouse pointer
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

a:hover { } -> select the anchor element over which the mouse pointer is being hovered
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

The :not() pseudo-class is used to select all that don't match the given selector e.g. :not(p) matches everything except paragraphs.
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Pseudo elements are used to style a part of an element rather than the whole element. e.g. p::first-line selects only the first lines of all paragraph elements
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

From lower to higher specificity: Type selectors and pseudo-elements, Class selctors and pseudo-classes, id selectors
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

The box model
=============

There are two types of boxes: inline boxes and block boxes
----------------------------------------------------------

The type of box applied to an element is defined by 'display' property
----------------------------------------------------------------------

CSS boxes has two display types: outer and inner display types
--------------------------------------------------------------

Outer display type details whether the box is block or inline
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Inner display type which dictates how elements inside the box are laid out
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

By default, the elements inside a box are laid out in normal flow i.e. like any other block or inline elements
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

We can change the inner display type by using display: flex, which makes the outer display type block but inner display type is changed to flex.
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

The display property values such as 'block' and 'inline' relates to the outer value of display.
-----------------------------------------------------------------------------------------------

Block boxes
-----------

It has outer display type of 'block'
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

The box will break onto a new line and will extend in inline direction to fill the space available in its container (becomes as wided as its container)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

The 'width' and 'height' properties are respected.
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Padding, margin and border will cause other elements to be pushed away from the box.
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Some html elements like <h1> and <p> use 'block' as their default outer display type.
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Inline boxes
------------

The box has outer display type of 'inline'.
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

The box will not break onto a new line.
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

The 'width' and 'height' properties will not apply.
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Vertical padding, margins and borders will apply but will not affect other inline boxes to move away i.e. may overlap other elements.
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Horizontal padding, margins and borders will apply and will cause other inline boxes to move away.
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Some html elements like <a>, <span>, <em> and <strong> use 'inline' as their outer display type by default.
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Special display value: inline-block
-----------------------------------

It provides a middle ground between inline and block.
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Useful in situations where you do not want an item to break onto a new line but do want it to respect width and height and avoid overlapping.
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Padding, margin and border will cause other elements to be pushed away.
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

It will only become larger than its content if you explicitly add width and height properties.
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

The CSS box model as a whole applies to block boxes and inline boxes use just some of the behavior defined in the box model.
----------------------------------------------------------------------------------------------------------------------------

The parts of a css block box: content box, padding box, border box and margin box
---------------------------------------------------------------------------------

.. image:: ./images/css-box-model.png

Margin and padding
------------------

Margin is the space outside the border of an element set with the shorthand margin property or individual margin-top, margin-right, margin-bottom and margin-left.
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

We can set all four margins to a single value with margin property by giving it a single value e.g. margin: 45px
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

We can also set all four margins to different values with clockwise notation
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

e.g. margin: 20 22 30 24 sets margin-top to 20, margin-right to 22, margin-bottom to 30 and margin-left to 24
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

The margin property can be set to negative values as well.
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Padding is the space between the border and the element itself.
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Similar to margin property, the padding property can have single or multiple values to set the padding.
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Borders
-------

Some properties related to the border of an element are: border-width, border-style, border-color.
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

We can make rounded borders with border-radius property; Higher value means more rounded border.
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

General units used in CSS
=========================

-  Units like px (pixels), in (inches), mm (millimeters),
   cm(centimeters) pt (points 1pt = 1/72 of inch), pc (pica 1pc= 12pt)
   are absolute units of measurement.
-  em (for font size, comes from the world of typography) is a relative
   unit for fonts. 1 em is the height of the font of current element,
   2em is twice the size of the font of current element.
-  rem is a unit that is measured relative to the font size of the root
   element, which is constant for the whole document.
-  vh and vw: are relative to 1% of viewport height and width
   respectively
-  %: percentage relative to the parent element.
-  See https://drafts.csswg.org/css-values-3/#absolute-lengths

Colors
======

-  Colors can be specified in several ways:
-  As predefined color names like "red", "maroon", "fuchsia", "teal",
   "orange", etc.
-  rgb values between 0 and 255 e.g. rgb(0, 255, 0) for green
-  pecentages like rgb(0%, 100%, 0%).
-  rgba i.e. rgb values with alpha value for transparency in addition.
-  The alpha value varies between 0 to 1.
-  Similarly we can use hsl and hsla color.
-  hexadecimal color codes like #00ff00 or shortcut #0f0.
-  There are two properties related to color: color and
   background-color.

Fonts
=====

-  fonts can be specified with the font shorthand property.
-  font(font-style, font-variant, font-weight, font-size/line-height,
   font-family)
-  Each of the above font properties can be set individually.
-  font-family can have generic font family names like 'serif',
   'monospace' etc.
-  It can also have font family names like 'times', 'courier', 'ariel'
   etc.
-  We can set multiple font-family types as fallback.
-  font-size property sets font size with predefined values like
   'medium', 'large', 'small', 'xlarge' etc.
-  font-size can also be set with exact length in cm,px,inch etc or
   percentage.
-  The 'inherit' value of font-size is used to inherit the fontsize of
   the parent element.
-  To use a third-party fonts like google fonts, we have to include the
   css file of the font in a <link> and use the font just as if it is an
   installed font using the font-family property.

Background styling
==================

-  We can set a background color with background-color property
-  We can set an image as the background image with background-image
   property.
-  We can use HTTP URLs with background-image property
-  We can use CSS functions like lineargradient(), radial-gradient()
   etc. with the background-image property.
-  We can specify whether to repeat a background-image with
   background-repeat property.
-  The background-attachment property specify whether the background
   moves when we scroll.

CSS variables
=============

-  We can declare a css variable (usually inside the body element or the
   :root element) and use it in several places.
-  We can declare a css variable as –variable-name: value e.g.
   –main-color: #2ae;
-  To use the above variable we do var(variable, backup-value) e.g.
   background-color: var(–main-color)
-  We can specify a backup value to the variable as the second argument
   to var e.g. background-color: var(–main-color, brown);
-  We can override a css variable declared in :root or body by
   redeclaring that variable in another element.

CSS media queries
=================

-  The @media queries allows us to use different styles for different
   types of screen.
-  We can check for a viewport's height or width, device's orientation
   etc. using media queries and set different css rules accordingly.
-  @media queries either resolve to true or false.
-  The syntax of a @media query is: @media not|only mediatype and
   (expressions) { css-properties}
-  The expression above is a single mediafeature or multiple
   mediafeatures connected with and,or,not.
-  mediatype is one of screen,print, speech or all(default).

CSS position
============

-  The position property determines how element is positioned.
-  position is one of static (default), fixed, absolute, relative and
   initial.
-  The top,right,bottom,left properties determine the final location of
   positioned elements.
-  static (the default) position renders the element according to the
   normal flow of the document.
-  In static, top, left, right, bottom and z-index has no effect.
-  In relative, the element is positioned according to the normal flow
   of the document and then offset relative to itself based on the
   values of top,left,right,bottom and z-index.
-  If the value of z-index is anything other than auto in relative
   position then it creates a new stacking context.
-  In absolute position, the element is removed from the normal flow of
   the document and no space is created for the element.
-  In absolute, the element is positioned relative to its nearest
   ancestor that isn't positioned as static if any, otherwise it is
   positioned relative to the initial containing block.
-  In absolute, top,right,bottom,left,z-index determine the final
   position of the element and the margins do not collapse with other
   margins.
-  The fixed position is just like absolute except it is positioned
   relative to the initial containing block established by the viewport.
-  In fixed position, left,top,right and bottom determine the final
   position.
-  The fixed position always creates a new stacking context.
-  The sticky position is a mix of relative and fixed. Rendered with the
   normal flow of the document but offset relative to the nearest
   scrolling ancestor and containing block.
-  An element positioned with sticky behaves like a relative positioned
   element until the page is scrolled then it behaves like a fixed
   positioned element.

CSS grid
========

CSS flexbox
===========

-  Flexbox layout model is used to display items in one dimension: as a
   row or a column.
-  We use 'display: flex' property in the containing element to enable
   this layout model.
-  There are two axes: the main axis and the cross axis along which we
   can align our items.
-  By default items are aligned along the main axis and by default items
   aligned in a row.
-  We can change the alignment along main axis by using 'flex-direction:
   column'.

alignment of items
------------------

-  We can modify the distribution of space around and between the items
   with justify-content property along the main axis.
-  We can change the vertical (or horizontal in case of flex-direction:
   column) alignment of items using align-items, the default is
   'stretch' which stretches the items to maximum height.
-  We can modify the distribution of space along the cross axis with
   align-content property but is useful for multiline flexbox only.
-  We can make items wrap onto next line with 'flex-wrap: wrap'
   property; this prevents the resizing of items when view port is
   shrinked.

items properties
----------------

-  We can override the space distribution between and around the items
   with properties inside flexbox items themselves.
-  We can prevent a flexbox item from shrinking when viewport shrinks
   with 'flex-shrink: 0'.
-  We can allow a flexbox item to take up remaining space using
   'flex-grow: 1'.
-  An item with 'flex-grow: 2' will take twice the remaining space than
   an item with 'flex-grow: 1'.
-  We can use align-self property to override the align-content property
   set in flexbox-container for the item.
-  We can change the order of the items with order property without
   changing the html (not recommended).
-  We can set the initial main size (width in case of row aligned and
   height in case of column aligned) of each flexbox item.
-  In case both width/height and flex-basis are set, flex-basis takes
   priority.
-  We can use the shorthand flex property to set flex-grow, flex-shrink
   and flex-basis (in that order) for a flexbox item e.g. flex: 2 2 10%
