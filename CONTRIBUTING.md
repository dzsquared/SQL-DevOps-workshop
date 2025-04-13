---
title: "Contributing"
description: "Guidelines and tips for contributing to these SQL DevOps workshop labs"
layout: page
permalink: /contributing/
---

**Reminder:** The contents of these labs are licensed under the [MIT License](/LICENSE) and your contributions will be made under the same license. For more information, see the [LICENSE](LICENSE) file and [https://opensource.org/licenses/MIT](https://opensource.org/licenses/MIT).

## Contributing small changes

If you have a small change, such as a typo or a minor formatting issue, please feel free to submit a pull request. Your improvements are very appreciated!

For changes to code that impacts functionality, please **include a screenshot** of the change in action, if possible. This will help us understand the impact of the change and make it easier to review. Each lab contains a `Results` folder that contains the expected results of the lab (and any prior labs). Ensure that your changes are **included in the `Results` folder** if they impact the output of the lab.

## Testing the static website locally

Depending on the size and type of change, you may want to test the rendering of the static website locally before submitting a pull request. The static website is built using [Jekyll](https://jekyllrb.com/), where most of the content written in markdown. To test the website locally, you will need to install Jekyll and its dependencies.

### Jekyll dependencies

- Ruby version 2.7.0 or higher, including all development headers (check your Ruby version using `ruby -v`)
- RubyGems (check your Gems version using `gem -v`)
- GCC and Make (check versions using `gcc -v`,`g++ -v`, and `make -v`)

### Installing Jekyll

Install Jekyll and Bundler gems:
   ```bash
   gem install jekyll bundler
   ```

### Building and running the website

Build and serve the website locally:
   ```bash
   bundle exec jekyll serve
   ```
This will start a local server at `http://localhost:4000`. You can view the website in your browser and see your changes in action.

## Contributing larger changes

The dynamic and expansive DevOps landscape means that there are many opportunities for improvement and expansion of the labs. If you have a larger change, such as a new lab or a significant update to an existing lab, please file an issue such that we can discuss the change and open a feature branch for the change. This will help make it easier to review.
