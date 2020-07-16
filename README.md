# permit

This sample Rails application demonstrates one way or managing sophisticated index views with several options that the user can select and combine.

## The problem

In modern index views it is usually possible to search for resources using a simple
text box input, together with a more sophisticated results filter. In addition, some means of ordering the displayed results is provided (*e.g.*, price: high to low).

For the best user experience, these options can be combined with no side effects.

Suppose that the user, for example, having elected to order results by price (rather than alphabetically) browses products using a simple search facility. If they subsequently modifies the search term, they expect their results to continue to be shown in price order, and not reset to whatever the default might be (e.g., most popular).

The problem becomes more annoying still if a more sophisticated filter is provided to help the user search more precisely. If the filter takes some effort on the part of the user to set up, then the UI will quickly gain a bad reputation if the filter is reset whenever the display order (for example) is changed.

## The solution

Typcally, these "view settings" are specific to a particular index view.

One option is to store these settings persistently - maybe in a database. THis might be considered overkill, and could be considered by some to be confusing for the user.

A second solution -- the one demonstrated here -- is to combine the various view options and encode them in the browser URL. This can get a little tricky. The method shown in the sample app can (arguably) help.

