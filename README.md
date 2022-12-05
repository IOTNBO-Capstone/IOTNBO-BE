<div align="center">
  <h1>IOTNBO API</h1>
  <h3>"It's OK To Not Be OK"</h3>
  <!-- <img src="images/roed_logo_sm.png" alt_text="IOTNBO Logo"><br> -->
</div>

<br></br>
(Want to hire the devs that worked on this project? Click [this link](#contributors) to jump to our project contributors!)

This repo is the Back End part of a project built by students at [Turing School of Software and Design](https://turing.edu/). The project itself is an original web app designed by combined Front End and Back End teams and its purpose is to help individuals seeking information on mental health resources in the Denver, CO area, especially those seeking low-cost/sliding scale Therapist options.

Visit our Front End Site!
- [IOTNBO](https://UPDATETHIS/)

Our Back End is hosted here and requires an API key to access (we are not giving any API keys out at this time):
- [IOTNBO API](https://iotnbo-be.fly.io/)

<br></br>
## Built With:
- ![Ruby](https://img.shields.io/badge/Ruby-CC342D?style=for-the-badge&logo=ruby&logoColor=white) **2.7.4**
- ![Rails](https://img.shields.io/badge/Ruby_on_Rails-CC0000?style=for-the-badge&logo=ruby-on-rails&logoColor=white) **5.2.8.1**
- ![GraphQL](https://img.shields.io/badge/-GraphQL-E10098?style=for-the-badge&logo=graphql&logoColor=white)
- ![PostgreSQL](https://img.shields.io/badge/PostgreSQL-316192?style=for-the-badge&logo=postgresql&logoColor=white)
<!-- update below with Fly -->
<!-- - ![Heroku](https://img.shields.io/badge/Heroku-430098?style=for-the-badge&logo=heroku&logoColor=white) -->

<br></br>
## Setup
If you'd like to demo this API on your local machine:
1. Ensure that you have the prerequisites or equivalent
2. Clone this repo and navigate to the root folder `cd iotnbo_be`
3. Run `bundle install`
4. Run `rails db:{drop,create,migrate,seed}`
5. (Optional) To run the test suite, run `bundle exec rspec`
6. Run `rails s`

You should now be able to hit the API endpoints using Postman or a similar tool.<br>
Default host is `http://localhost:3000`

<br></br>
## Database Schema
<!-- ![Database Schema Image](/images/roed_to_aid_database_schema.png "Database Schema Image") -->

<br></br>
## Endpoints

### GraphQL
https://UPDATEWITHIOTNBOFLYURL/graphql<br>
The GraphQL endpoints supply information based on all therapists or an individual therapist.
<br>
The API key should be sent in the params of the request as shown in the examples and the query should be sent in the body. Below are some examples of queries that can be used.
- All States
  - POST https://UPDATEWITHIOTNBOFLYURL/graphql?api_key=API_KEY_HERE
  - ```
    query {
      therapists {
        id
        name
        labels
        bio
        practice {
          id
          name
          websiteUrl
        }
      }
    }
    ```

<br></br>
## Contributors
### Back End Team
<table>
  <tr>
    <td><img src="https://avatars.githubusercontent.com/u/UPDATE?s=120&v=4"></td>
    <td><img src="https://avatars.githubusercontent.com/u/UPDATE?s=120&v=4"></td>
    <td><img src="https://avatars.githubusercontent.com/u/UPDATE?s=120&v=4"></td>
  </tr>
  <tr>
    <td>Thomas Hayes</td>
    <td>Candace Eckels</td>
    <td>Taryn Orlemann</td>
  </tr>
  <tr>
    <td>
      <a href="https://github.com/UPDATE">GitHub</a><br>
      <a href="https://www.linkedin.com/in/UPDATE/">LinkedIn</a>
    </td>
    <td>
      <a href="https://github.com/UPDATE">GitHub</a><br>
      <a href="https://www.linkedin.com/in/UPDATE/">LinkedIn</a>
    </td>
    <td>
      <a href="https://github.com/UPDATE">GitHub</a><br>
      <a href="https://www.linkedin.com/in/UPDATE/">LinkedIn</a>
    </td>
  </tr>
</table>


### Front End Team


### Instructor/Project Manager
