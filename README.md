[![Build Status](https://travis-ci.org/naridas/babylon_test.svg?branch=master)](https://travis-ci.org/naridas/babylon_test)
[![Coverage Status](https://coveralls.io/repos/github/naridas/babylon_test/badge.svg?branch=master)](https://coveralls.io/github/naridas/babylon_test?branch=master)


# babylon_test

## The Test

Our client is an online marketplace, here is a sample of some of the products available on our site:

Productcode |Name |Price

001 |Lavenderheart |£9.25

002 |Personalisedcufflinks|£45.00

003 |KidsT­shirt |£19.95

Our marketing team want to offer promotions as an incentive for our customers to purchase these items.
If you spend over £60, then you get 10% off of your purchase. If you buy 2 or more lavender hearts then the
price drops to £8.50.
Our check­out can scan items in any order, and because our promotions will change, it needs to be flexible
regarding our promotional rules.

The interface to our checkout looks like this (shown in Ruby):

co=Checkout.new​(promotional_rules)

co.scan​(item)

co.scan​(item)

price=co.total

Implement a checkout system that fulfills these requirements. Do this outside of any frameworks. We’re
looking for candidates to demonstrate their knowledge of TDD.

Testdata

Basket:001,002,003

Total price expected:£66.78

Basket:001,003,001

Total price expected:£36.95

Basket:001,002,001,003

Total price expected:£73.76

## Set up

- git clone
- bundle
- rspec (to get tests)
 
## Technology used

Ruby, Rspec, Hound, Travis, Coveralls

## My Simplfied Thought Process

- Made product class first since it is the easiest to do but will be used a lot
- Started to work on promo rules where most of the work is done, spent a lot time here thinking if i should split it or not but decided to make it then refactor it later if necessary
- Checkout is my interface so made it do the minimum work
- Created a view to make my data look like the test data
- Took out calculations from promo rules since i felt they were different responsibilities 
- Made calculations and promo rules more flexible so you can input your own promos with similar rules
