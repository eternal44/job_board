Denarius **beta**
========

An open source job board for day laborers

## Summary
Think GlassDoor meets LinkedIn meets Yelp for day labor programs.

Denarius allows day laborers to connect with employers
- Employers can request well rated workers
- Day laborers can more easily access available jobs
- Admin(s) can monitor activities to make sure all is as it
  should be

## Change Log
See CHANGELOG.md for more details & features we're working on.

## Local installation & running tests:
1. Once you've forked and cloned this repository:
```sh
$ bundle
$ rake db:migrate
$ rake db:seed
```
2. Run tests with MiniTest & Guard
**Please note**:  testing will lag behind development while we're
scaffolding a layout
```sh
$ bundle exec guard
```

## Design Concepts:
Multiple day labor programs have requested a job board that can help
automate their currently manual process for connecting employers with
workers.  We're still working out the layout and logic for this site
with a partner day labor program so a final design is still in the works.
Check out the following links for a quick peek:

* [live demo](https://denarius.herokuapp.com/)
* [a video walk through of admin features](https://www.youtube.com/watch?v=aalFIHzBZ1U)

## Developer Contributions
Please base pull requests on the 'dev' branch.  If you see a feature
that should be added feel free to create an 'issue' for discussion.

If you'd like to help but don't know where to start I'd be more than
happy to point you in the right direction.
email: jamesyoun710@gmail.com

**Note**: If a large and committed enough group of devs want to switch tech stacks
I'm open to it.  Until then let's continue with Rails to provide a quick
and well working solution for our partner organizations.

## Style Guide
Please do your best to follow this [style
guide](https://github.com/bbatsov/rails-style-guide).

## License
Copyright (c) 2015 Code for America | MIT License
