# Gilded Rose Tech Test

<div align="left">
  <img src="https://img.shields.io/badge/ruby-%23CC342D.svg?style=for-the-badge&logo=ruby&logoColor=white"/>&nbsp
  <img src="https://img.shields.io/badge/RSpec-blue?style=for-the-badge&logo=Rspec&logoColor=white" alt="Rspec"/>
  <img src="https://img.shields.io/badge/Test_coverage:_99.10-blue?style=for-the-badge&logo=Rspec&logoColor=white" alt="Rspec"/>
</div><br>


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
_So that I never undersell 'Aged Brie'_<br>
**_I want to increase its quality as it gets older_**

_As a user,_<br>
_So that I never undersell 'Sulfuras'_<br>
**_I want to keep its quality the same until it is sold_**

_As a user,_<br>
_So that I never undersell 'Backstage passes'_<br>
**_I want to icrease their quality by 1, 2 and 3 when there are more than 10, less than 10 or 5 days left respectively until sell by date and then drop it to 0_**

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
git clone https://github.com/EvSivtsova/gilded-rose-tech-test.git
cd gilded-rose-tech-test
bundle install
```
To run the file and print the bank statement required:

`ruby gilded_rose.rb`

To run tests and lint the code use:

`rspec`

`rubocop`

## Code design

The legacy code was not easy to read and didn't allow for easy modification in case of specifications' change.

Using the concept of polymorphism four classes have been created to update the quality and sell_in values for each product type:

1. Item class for standard items
2. Sulfuras class for 'Sulfuras, Hand of Ragnaros' items
3. Backstage class for 'Backstage passes to a TAFKAL80ETC concert' items
4. AgedBrie class for 'Aged Brie' items

The Sulfuras, Backstage and AgedBrie classes inherit properties and methods from the Item class and override Item's methods to update quality and sell_in values in line with specifications for each item type.

When updating the values, the sell_in value gets amended first to reflect the fact that updates take place at the end of each day and the value of sell_in will determine items' quality value.

Once the classes have been created and tested, I designed ItemFactory class that:
* accepts an array of items
* uses regex to match the name of each item to a corresponding Class
* creates an instance of that class for each item
* There is also a method to create an instance of item class for one item only, if required.

The process is further automated by refactoring of the GildedRose class, which:
* iterates through an array of item objects (different types of items)
* calls the method that update the values of sell_in and quality
* prints the updated values to the console, if necessary.

The above changes enabled a fast implementation of the Conjured class, which allows to manage the quality of the Conjured item.

The following input array

<img src="https://github.com/EvSivtsova/gilded-rose-tech-test/blob/main/outputs/gilded-rose-input.png" width='400'>

provides the following output 

<img src="https://github.com/EvSivtsova/gilded-rose-tech-test/blob/main/outputs/gilded-rose-output.png" width='400'>

<img src="https://github.com/EvSivtsova/gilded-rose-tech-test/blob/main/outputs/gilded-rose-test-coverage.png" width='400'>

<img src="https://github.com/EvSivtsova/gilded-rose-tech-test/blob/main/outputs/gilded-rose-rubocop.png" width='400'>
