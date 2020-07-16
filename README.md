# permit

This sample Rails application demonstrates one way or managing sophisticated index views with several options that the user can select and combine.

## The problem

In modern index views it is usually possible to search for resources using a simple
quick search facility, together with a more advanced results filter. Some means of ordering the displayed results is generally provided (*e.g.*, price: high to low).

For the best user experience, it should be possible to combine these options no unexpected side effects.

Suppose that a user, having elected to order results by price, browses products using the quick search box. If they subsequently modify the search term and try again, they expect their results to continue to be shown in price order, and not reset to most popular.

The problem is more annoying still if a more sophisticated filter is provided to help the user search more precisely. If the filter takes some effort on the part of the user to set up, then the UI will quickly gain a bad reputation if the filter is reset whenever the display order or search term is changed.

## The solution

Typcally, these "view settings" are specific to a particular index view.

One option is to store these settings persistently - maybe in a database. This might be considered overkill by some, and could be confusing for the user.

A second solution -- the one demonstrated here -- is to combine the various view options and encode them in the browser URL. This can get a little tricky. The method shown in the sample app can (arguably) help.

## Description

The sample app has three view options for its widgets listing:

  * a quick search
  * a category filter
  * an order-by option

These options can be combined as requied.
