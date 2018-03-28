Gilded Rose Tech Test
=====================

Gilded Rose Requirements Specification
======================================

Hi and welcome to team Gilded Rose. As you know, we are a small inn with a prime location in a
prominent city ran by a friendly innkeeper named Allison. We also buy and sell only the finest goods.
Unfortunately, our goods are constantly degrading in quality as they approach their sell by date. We
have a system in place that updates our inventory for us. It was developed by a no-nonsense type named
Leeroy, who has moved on to new adventures. Your task is to add the new feature to our system so that
we can begin selling a new category of items. First an introduction to our system:

	- All items have a SellIn value which denotes the number of days we have to sell the item
	- All items have a Quality value which denotes how valuable the item is
	- At the end of each day our system lowers both values for every item

Pretty simple, right? Well this is where it gets interesting:

	- Once the sell by date has passed, Quality degrades twice as fast
	- The Quality of an item is never negative
	- "Aged Brie" actually increases in Quality the older it gets
	- The Quality of an item is never more than 50
	- "Sulfuras", being a legendary item, never has to be sold or decreases in Quality
	- "Backstage passes", like aged brie, increases in Quality as its SellIn value approaches;
	Quality increases by 2 when there are 10 days or less and by 3 when there are 5 days or less but
	Quality drops to 0 after the concert

We have recently signed a supplier of conjured items. This requires an update to our system:

	- "Conjured" items degrade in Quality twice as fast as normal items

Feel free to make any changes to the UpdateQuality method and add any new code as long as everything
still works correctly. However, do not alter the Item class or Items property as those belong to the
goblin in the corner who will insta-rage and one-shot you as he doesn't believe in shared code
ownership (you can make the UpdateQuality method and Items property static if you like, we'll cover
for you).

Just for clarification, an item can never have its Quality increase above 50, however "Sulfuras" is a
legendary item and as such its Quality is 80 and it never alters.

How to run
----------

1. `git clone https://github.com/stilley85/gilded_rose_tech_test.git`
2. `cd gilded_rose`
3. `gem install bundle`
4. `bundle`
5. `rspec` - To run tests.
6. `ruby spec/texttest_fixture.rb` - To see test text output.

My approach
-----------

I began by fixing the test given to try and get an idea of what the code was doing.
As only a single test was given this wasn't much help so I began looking through the code to
get an idea of what was happening. Once I had an idea of what the code was doing I decided
the most useful thing to do would be to write tests before moving forward with refactoring the code.

Once I'd written a testing suite I refactored the code to be easier for me to read and adapt. I then broke it down into methods, ensuring the tests remained passing throughout. These methods
enable me to see I would need a separate class for each type of item so I created item type classes which inherited from the Item class. My tests all remained in the gildedrose_spec file which now relied on multiple classes so I pulled the relevant tests out into their own class spec files.
