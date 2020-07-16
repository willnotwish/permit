# permit

This sample Rails application demonstrates one way or managing sophisticated index views with several options that the user can select and combine.

## The problem

In modern index views it is usually possible to search for resources using a "quick search" box, together with a more advanced search filter. Some means of ordering is generally provided (*e.g.*, by price: high to low).

For the best user experience, it should be possible to combine these options without unexpected side effects.

Suppose that a user, having elected to order results by price, browses products using the quick search box. If that user subsequently modifies the search term and tries again, they would expect their results to continue to be shown in price order, and not reset to (for example) *most popular*, seemingly at random.

The problem is more annoying still if the advanced filter takes some effort on the part of the user to set up. The UI will gain a bad reputation if such a filter is reset whenever the display order or search term is changed.

## The solution

Typcally, these "view settings" are specific to a particular index view.

One option is to store the settings persistently - maybe in a database. This is perhaps overkill and could be confusing for the user.

A second solution – demonstrated here – is to combine the various view options and encode them in the browser URL. This can get a little tricky: separation of concerns goes by the wayside as controller logic tends to get mixed into the view.

The method shown in the sample app can help.

## Description

The sample app has three view options for its widgets listing:

  * a quick search
  * a category filter
  * an order-by option

These options can be combined as required.
