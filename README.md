# GNOME Contributors List

The source for the [The Faces of GNOME](https://contributors.gnome.org)

## About

Contributors is a web site that lists and indexes all the past and current Contributors of GNOME.
The site is developed with
and maintained using [Jekyll][official-jekyll], a Static Site Generator
developed with Ruby. The site uses following types of files for the content
generation:

 * HTML files with extension `.html`
 * Markdown files with extension `.md`

The data used by the site is stored in the form of following files:

 * YAML files with extension `.yml`
 * JSON files with extension `.json`

## Project Structure

    ...
    ├── .gitlab/                            #contains gitlab template files for bugs and merge requests
    ├── _data/                              #contains site's data files
    │   ├── members/                        #contains all the members/contributors stored in the platform in YML format
    │   ├── navigation.yml                  #links to be added to the site's header and footer sections
    │   ├── projects.json                   #contains all the GNOME projects metadata
    │   ├── badges.json                     #contains metadata of all GNOME Badges/Tags
    │   ├── events.json                     #contains metadata of all GNOME conferences
    │   ├── social_networks.json            #contains all kind of supported social networks
    ├── _includes/                          #contains numerous templates like headers and footer
    │   ├── footer.html                     #the footer of the site
    │   ├── header.html                     #the meta data of the site
    │   └── navbar.html                     #the navbar of the site
    │   └── contributors/                   #contains templates for the contributors pages
    │   └── foundation/                     #contains templates for the foundation pages
    │   └── speakers/                       #contains templates for the speakers pages
    │   └── sections/                       #generic templates reused across the website
    │       ├── members.html                #contains the member widget template
    │       ├── member-speaker.html         #contains a member widget that shows the conferences the member attended instead of the badges
    │       └── member-reduced.html         #contains a reduced member widget template without badges
    ├── assets/                             #contains site's valuable entities
    │   ├── font/                           #contains site's font: Red Hat Display
    │   ├── img/                            #contains site's images and illustrations
    │   └── scss                            #contains site's preprocessor stylesheets   
    │       ├── colorful.scss               #stylesheet for syntax highlighting
    │       ├── index.scss                  #stylesheet for user defined styles
    │       ├── markdown.scss               #stylesheet for styling the markdown content
    │       └── theme.scss                  #stylesheet for website's theme. Generated from Bootstrap 
    ├── collections/                        #contains the site's collections
    │   ├── _pages/                         #contains site's main pages
    ├── _config.yml                         #contains Jekyll settings for the site
    ├── .gitignore
    ├── .gitlab-ci.yml                      #for Gitlab Continuous Integration and Deployment
    ├── 404.html                            #custom not found page. Only works when deployed to GitLab Pages
    ├── CODE_OF_CONDUCT.md
    ├── Gemfile                             #contains gem dependencies for the site.
    ├── Gemfile.lock
    ├── LICENSE.txt
    ├── package-lock.json
    ├── package.json                        #contains node dependencies for the site.
    ├── README.md
    └── setup.sh                            #script for setting up the website

## Adding yourself to the Website

Just create a new YAML file on `_data/members/` directory containing the following entries. You may also give a look on [this template](_data/member-template.yml)

| Field         | Description                                       | Example                 | Type                                                    |
| ------------- |:-------------------------------------------------:| -----------------------:| ------------------------------------------------------- |
| name          | Your name                                         | John Smith              | string                                                  |
| avatar        | Your Avatar Image                                 | https://imgur.com/image | string/boolean                                          |
| title         | Your current position at the GNOME Project        | Community Manager       | string                                                  |
| badges        | All the badges/roles you held at GNOME/Foundation | `['engagement-team']`   | array:entries from `badges.json`                        |
| active        | If you're a current/active GNOME Contributor      | `true`                  | boolean                                                 |
| projects      | The Projects/Repositories you're working on       | `['gtk']`               | array:entries from `projects.json`                      |
| conferences   | The Conferences you participated                  | `['guadec-2018']`       | array:entries from `events.json`                        |
| social        | Social Networks that you have                     | `{'twitter': 'handle'}` | collection:key from `social_networks.json`;value:string |

Then just add a new entry and commit the changes with a **Merge Request**. It will be approved if it's correct.

## Add Custom Badges/Social Networks and Projects

You're also free to add new Badges and Social Networks and Projects/Repositories, by creating new entries on the `social_networks.json`, `badges.json` and `projects.json`.

## Setup Locally

To get the site up and running locally, follow the below steps:

1. Install a full [Ruby development environment](https://jekyllrb.com/docs/installation/).
2. Create a local clone of the website:
```
git clone https://gitlab.gnome.org/Teams/Engagement/websites/contributors-index.git
```
3. Change into the contributors-index directory
```
cd contributors-index
```
4. Perform the following commands to install dependencies and structure the website properly:
```
chmod +x setup.sh && bash setup.sh
```
5. Build the site and make it available on your local server
```
$ bundle exec jekyll serve
```
6. Browse to [http://localhost:4000](http://localhost:4000) to view the website.

## Dependencies

This project relies on the dependencies as well. These dependencies are provided
in the Ruby `Gemfile` or NPM's `package.json`. Following table shows the
list of dependencies used by this project:

Package | Version | File | Source
--- | --- | --- | ---
bootstrap | `4.4.1` | [package.json][package.json] | [Github](https://github.com/twbs/bootstrap)
@fortawesome/fontawesome-free | `5.12.0` | [package.json][package.json] | [Github](https://github.com/FortAwesome/Font-Awesome)
jquery | `3.4.1` | [package.json][package.json] | [Github](https://github.com/jquery/jquery)
popper.js | `1.16.1` | [package.json][package.json] | [Github](https://github.com/FezVrasta/popper.js/)
slick-carousel | `1.8.1` | [package.json][package.json] | [Github](https://github.com/kenwheeler/slick/)
moment | `2.24.0` | [package.json][package.json] | [Github](https://github.com/moment/moment/)
node-sass | `4.13.1` | [package.json][package.json] | [Github](https://github.com/sass/node-sass/)
jekyll | `3.8.5` | [Gemfile][Gemfile] | [Github](https://github.com/jekyll/jekyll/)

Read about adding/updating/removing dependencies on [how to contribute](CONTRIBUTING.MD#addingupdatingremoving-dependencies).

## Pipeline

The pipeline used by the website is the top-level component of continuous
integration, delivery, and deployment.

The pipeline defined by this repository uses the `Ruby2.5` image. The pipeline
consists of a script that runs before the site is tested/deployed. The
script that runs before the test/deployment of the website basically
installs all the `gem/npm dependencies` and then builds the website
before testing/deploying.

`test` stage is performed on all branches but `master`. `deploy` stage on
the other hand is performed only on `master` branch.

## Code of Conduct

This project is an open source project with a contributor community that spans across
the globe. We want everyone in our community to feel safe and encourage the
participation of people from all forms of backgrounds, regardless of
experience level, age, gender, identity, race, religion, or nationality.  We
expect all contributors to uphold the [Code of Conduct][code-of-conduct].

## License Information

This project is licensed under the [Creative Commons BY-SA-4.0][license].

<!-- markdown variables -->
[contributing]: CONTRIBUTING.MD
[code-of-conduct]: CODE_OF_CONDUCT.MD
[official-jekyll]: https://jekyllrb.com
[package.json]: package.json
[Gemfile]: Gemfile
[license]: LICENSE.txt
