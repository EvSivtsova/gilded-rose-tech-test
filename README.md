# Guilded Rose Tech Test

This is the Makers' Academy challenge with the following requirements:

## Quality control system requirements

This is a well known kata developed by [Terry Hughes](http://iamnotmyself.com/2011/02/13/refactor-this-the-gilded-rose-kata/). 


All items have a `SellIn` value which denotes the number of days we have to sell the item. All items have a `Quality` value which denotes how valuable the item is. At the end of each day our system lowers both values for every item. Pretty simple, right? Well this is where it gets interesting:

* Once the sell by date has passed, `Quality` degrades twice as fast
* The `Quality` of an item is never negative
* “Aged Brie” actually increases in `Quality` the older it gets
* The `Quality` of an item is never more than 50
* “Sulfuras”, being a legendary item, never has to be sold or decreases in `Quality`
* “Backstage passes”, like aged brie, increases in `Quality` as it’s `SellIn` value approaches; `Quality` increases by 2 when there are 10 days or less and by 3 when there are 5 days or less but `Quality` drops to 0 after the concert

We have recently signed a supplier of conjured items. This requires an update to our system:

* “Conjured” items degrade in `Quality` twice as fast as normal items

Feel free to make any changes to the `UpdateQuality` method and add any new code as long as everything still works correctly. However, do not alter the Item class or Items property.

### The brief:

The aim is to practice good design in the language of your choice. Refactor the code in such a way that adding the new "conjured" functionality is easy.

Feel free to copy [the ruby code](https://github.com/emilybache/GildedRose-Refactoring-Kata/blob/main/ruby/gilded_rose.rb) into a new folder and write your tests from scratch.

## User stories

Based on the above requirements, I developed the following user stories:

_As a user,_<br>
_So that we sell only quality products_<br>
**_at the end of each day I want to be able to change product quality adn sell in value based on the type of product and expiry date_**

_As a user,_<br>
_So that we control the quality of the products_<br>
**_I want to ensure that the quality of the products ranges from 0 to 50_**

_As a user,_<br>
_So that we sell only quality products_<br>
**_I want to ensure that the quality of the products degrades twice as fast after sell by date_**

_As a user,_<br>
_So that I never undersell 'Sulfuras'_<br>
**_I want to keep its quality the same until it is sold_**

_As a user,_<br>
_So that I never undersell 'Baackstage passes'_<br>
**_I want to icrease their quality by 2 and by 3 when there are 10 or 5 days left until sell by date respectively and then drop it to 0_**

_As a user,_<br>
_So that we sell only quality products_<br>
**_I want to ensure that the quality of 'Conjured' items degrades twice as fast_**

## TechBit

Technologies used: 
* Ruby(3.0.0)
* RVM
* Rspec(Testing)
* Rubocop(Linter)
* Simplecov(Test Coverage)

To install the project clone the repository and run `bundle install` the dependencies within bankTechTest folder:

```
git clone https://github.com/EvSivtsova/guilded_rose_tech_test.git
cd guilded_rose_tech_test
bundle install
```

To run tests and lint the code use:

`rspec`

`rubocop`

## Code design
