# Quality Control Metrics
This is a test-driven web application that imports and parses a proprietary tab-delimited file.

## Features:
<ol>
<li> User can import file and create records accordingly </li>
<li> User can view imported samples </li>
<li> User can view imported projects </li>
<li> User can view imported principal investigators </li>
<li> User can sort by table headings </li>
<li> User can filter by passable and unpassable scopes </li>
</ol>

## Possible Additions:
<ul>
<li> Allow user to create, update, and destroy records via the application interface </li>
<li> Optimize layout for mobile devices </li>
<li> Refactor </li>
</ul>

## Development Overview

### Tool Chain
  * RVM
  * Ruby 2.1.2
  * PostgreSQL 9.3.4

### Additional Tool Chain Notes
  * I used Poltergeist for testing, so you will need PhantomJS installed (`brew install phantomjs`, for instance).

### Project Setup
  1. Install things in the tool chain
  2. Run `bundle`
  3. Run `rake db:create:all` and `rake db:migrate` to set up your database
  4. Run `rake` and confirm that all of the tests are passing for you.

##Author:

Akshay 'Shay' Narang

##License:

Copyright (c) 2014 Akshay 'Shay' Narang

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
