# About this repository

## Overview

This repository holds the codebase that supports [my website](https://keithpitty.com). It is written in Ruby on Rails, currently using version 5.2. 

These days the application runs on Heroku using a Postgres database, MemCachier for caching, Papertrail for logging, and Twilio SendGrid for sending emails. I forget where I initially deployed it to back in 2007!

It is a relatively simple Rails application that has served its purpose over the intervening years.

Below I explain the features of the application, its history, and some notes about the codebase.

_Keith Pitty_

_21 March, 2021_

## Features

### Public facing

The public faces site provides the following:

* a navigation menu at the top of the layout;
* a home page;
* the latest blog post;
* a comment form for posts that have this feature switched on;
* a list of all blog posts, dating back to 2008;
* a page detailing information about my work history;
* a list of testimonials from others;
* a form for users to contact me

### Admin UI

The admin UI provides me, when logged in, to:

* add and update achievements that are displayed on the public About page;
* add and update testimonials;
* draft and publish blog posts;
* enable or disable comments on blog posts;
* view comments and remove those that have been caught as spam;
* add images

### Redundant features

The repository contains some redundant code for features that are no longer supported:

* tags
* an RSS feed
* a page showing services I offered when I was freelancing

One day I intend to clean these up. Perhaps I'll revive the RSS feed.

## History

I first developed this application in 2007, using Rails 1.2. This predated git! My initial commits were made using Subversion.

I've endeavoured to maintain and upgrade the application since then. Some blog posts that I've written along the way that describe such maintenance include:

* My [initial blog post](https://keithpitty.com/blog/archives/2008-10-13-site-upgrade), which focussed on my attempts to improve the visual design but also noted that I had added a blog;
* Notes about [upgrading the application to Rails 3](https://keithpitty.com/blog/archives/2011-02-27-upgrading-to-rails-3);
* An admission that web design is not a skill in my sweetspot with the resultant [switch to Twitter Bootstrap](https://keithpitty.com/blog/archives/2011-02-27-upgrading-to-rails-3);
* How I [adopted Tailwind CSS](https://keithpitty.com/blog/archives/2020-04-14-adopting-tailwind-css)

I'll provide some notes below about the codebase with more focus on the back-end. Meanwhile, I note that whilst the site currently runs on Rails 5.2, I intend to complete upgrading it to Rails 6.1 in the near future.

## Notes about the codebase

### Models

* `Achievement` includes straight-forward validation;
* `BlogPost` includes:
	* `has_many` relationship with comments;
	* validation;
	* scopes for published and draft posts;
	* several public and private instance methods
* `Comment` includes:
	* `belongs_to` relationship with blog post;
	* makes use of `rakismet` gem;
	* validation, using regex for email validation
* `Contact` includes straight-forward validation;
* `Image` stores images on S3, using the `paperclip` gem (which needs to be replaced);
* `Testimonial` includes straight-forward validation;
* `User` and `UserSession` make use of the `authlogic` gem

### Controllers

* `Admin::AchievementsController` enables CRUD for achievements;
* `Admin::BlogPostsController` enables CRUD for blog posts, expiring fragment caches where appropriate;
* `Admin::CommentsController` enables management of comments, many of which will have been marked as spam;
* `Admin::ImagesController` facilitates creation and removal of images from S3;
* `Admin::TestimonialsController` enables CRUD for testimonials;
* `Blog::ArchivesController` includes:
	* `index` and `show` methods to support blog archives list and individual blog post pages;
	* a `create_comment` method, which expires fragment caches in the process of responding to the submission of a comment form;
*  `AboutController` supports the About page by including achievements;
*  `AdminLayoutController` ensures that a user must be logged in to gain access to the admin features;
*  `ApplicationController` contains common methods used by other controllers;
*  `BlogController` redirects to the latest published post;
*  `BlogPostsController` redirects a request to show a blog post to the `Blog::ArchivesController`;
*  `ContactsController` enables a message from the Contact page to be saved and emailed (this is currently broken);
*  `HomeController` supports the home page by retrieving the latest three published posts;
*  `TestimonialsController` supports the Testimonials page;
*  `UserSessionsController` supports sessions for the admin user

### Views

Some points to note:

* The views that include forms make use of the `simple_form` gem;
* Tailwind CSS styles are used;
* Several shared partials are used;
* Helper methods are used to enable code syntax highlighting via the `coderay` gem;
* The view code in `app/views/blog/archives/show.html.erb` makes use of caching of comments;
* Navigation is provided at the bottom of a post to previous and next posts

### Helpers

* Several useful helper methods are provided to views in `ApplicationHelper`;
* `EmojiHelper` enables Slack style emoji text to be translated into the matching image. See [this post](https://keithpitty.com/blog/archives/2017-06-01-achieving-flow-in-a-development-team) for an example of usage

### Caching

* Fragment caching is used within many of the views for the public-facing pages;
* In production, this is supported by the MemCachier Heroku add-on

### Mailers

The `CommentMailer` and `ContactMailer` classes support sending email resulting from submitting comment and contact forms.

### Specs

The following types of RSpec automated tests are run on CircleCI:

* unit tests of the Admin controllers;
* unit tests for some of the actions of controllers that support the public facing pages;
* unit tests for helper methods;
* unit tests for the methods on the `BlogPost` model;
* feature tests for:
	* an admin user logging in and out;
	* an admin user creating a blog post;
	* a public user submitting a comment;
	* a public user visiting all parts of the site

Specs are supported by the `factory_bot_rails` gem.

### Opportunities for improvement

* fix broken email configuration;
* fix broken RSS feed;
* replace use of deprecated `paperclip` gem with `ActiveStorage`;
* remove artifacts that are left over from features that are no longer supported;