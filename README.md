<div align="center">
  <h1>Equilibrium API</h1>
  <!-- <img src="images/roed_logo_sm.png" alt_text="IOTNBO Logo"><br> -->
</div>

<!-- Badges -->
<p>
  <a href="https://github.com/IOTNBO-Capstone/IOTNBO-BE/graphs/contributors">
    <img src="https://img.shields.io/github/contributors/IOTNBO-Capstone/IOTNBO-BE" alt="contributors" />
  </a>
  <a href="">
    <img src="https://img.shields.io/github/last-commit/IOTNBO-Capstone/IOTNBO-BE" alt="last update" />
  </a>
  <a href="https://github.com/IOTNBO-Capstone/IOTNBO-BE/network/members">
    <img src="https://img.shields.io/github/forks/Louis3797/awesome-readme-template" alt="forks" />
  </a>
  <a href="https://github.com/IOTNBO-Capstone/IOTNBO-BE/stargazers">
    <img src="https://img.shields.io/github/stars/IOTNBO-Capstone/IOTNBO-BE" alt="stars" />
  </a>
  <a href="https://github.com/IOTNBO-Capstone/IOTNBO-BE/issues">
    <img src="https://img.shields.io/github/issues/IOTNBO-Capstone/IOTNBO-BE" alt="open issues" />
  </a>
  <a href="https://github.com/IOTNBO-Capstone/IOTNBO-BE/blob/master/LICENSE">
    <img src="https://img.shields.io/github/license/IOTNBO-Capstone/IOTNBO-BE.svg" alt="license" />
  </a>
</p>

<br></br>
(Want to hire the devs that worked on this project? Click [this link](#contributors) to jump to our project contributors!)

Welcome, and thank you for visiting our API, where "it's okay to not be okay". This repo is the Back End part of a project built by students at [Turing School of Software and Design](https://turing.edu/). The project itself is an original web app designed by combined Front End and Back End teams and its purpose is to help individuals seeking information on mental health resources in the Denver, CO area, especially those seeking low-cost/sliding scale Therapist options. We made the decision to seed the database with Lord of the Rings characters in lieu of the real information of therapists in the Denver area. Were the app to go live, we would replace the dummy data after seeking the necessary permissions of all parties to be involved. Disclaimer: the Lord of the Rings characters are the intellectual property of their creators, the Equilibrium team does not claim any rights to the characters.

Visit our Front End Site!
- [Equilibrium](https://UPDATETHIS/)

Our Back End is hosted here (it's not much to look at without the FE, but here it is anyway):
- [Equilibrium API](https://equilibrium.herokuapp.com/)

<br></br>
## Built With:
- ![Ruby](https://img.shields.io/badge/Ruby-CC342D?style=for-the-badge&logo=ruby&logoColor=white) **2.7.4**
- ![Rails](https://img.shields.io/badge/Ruby_on_Rails-CC0000?style=for-the-badge&logo=ruby-on-rails&logoColor=white) **5.2.8.1**
- ![GraphQL](https://img.shields.io/badge/-GraphQL-E10098?style=for-the-badge&logo=graphql&logoColor=white)
- ![PostgreSQL](https://img.shields.io/badge/PostgreSQL-316192?style=for-the-badge&logo=postgresql&logoColor=white)
- ![Heroku](https://img.shields.io/badge/Heroku-430098?style=for-the-badge&logo=heroku&logoColor=white)

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
Default host is `http://localhost:3000/graphql`

<br></br>
## Database Schema
![Screen Shot 2022-12-03 at 11 23 41 AM](https://user-images.githubusercontent.com/106449394/207664849-57cc33b1-520e-4d46-b5c9-2282531f8d0c.png)

<br></br>
## Endpoints

### GraphQL
The GraphQL endpoints supply information based on all therapists or an individual therapist. The query should be sent in the body. Below are some examples of queries that can be used.<br>
- POST https://equilibrium.herokuapp.com/graphql
  - Get All Therapists
    - ```
      query {
        therapists {
          id
          address
          phoneNumber
          name
          labels
          imageUrl
          bio
          practice {
            id
            name
            websiteUrl
          }
        }
      }
      ```
  - Get Therapist by ID
    - ```
      query {
        therapist(id: id) {
          id
          address
          phoneNumber
          name
          labels
          imageUrl
          bio
          practice {
            id
            name
            websiteUrl
          }
        }
      }
      ```
Please follow [this link](https://UPDATETHISLINK/) to watch a demonstration in Postman of additional endpoints that have been built out for our database.

<br></br>
## Contributors
### Back End Team
<table align="center">
    <tr>
        <td align="center"> Candace Eckels: <a href="https://github.com/cece-132">GitHub</a> | <a href="https://www.linkedin.com/in/candace-eckels-b66089201/">LinkedIn</a></td>
        <td align="center"> Taryn Orlemann: <a href="https://github.com/torlemann">GitHub</a> | <a href="https://www.linkedin.com/in/taryn-orlemann-99792519a/">LinkedIn</a></td>
        <td align="center"> Thomas Hayes: <a href="https://github.com/thayes87">GitHub</a> | <a href="https://www.linkedin.com/in/thomas-c-hayes/">LinkedIn</a></td>
    </tr>
 <td align="center"><img src="https://avatars.githubusercontent.com/u/100653933?v=4" alt="Candace Eckels GitHub"
 width="150" height="auto" /></td>
 <td align="center"><img src="https://avatars.githubusercontent.com/u/106449394?v=4" alt="Taryn Orlemann GitHub"
 width="150" height="auto" /></td>
 <td align="center"><img src="https://avatars.githubusercontent.com/u/106878296?v=4" alt="Thomas Hayes GitHub"
 width="150" height="auto" /></td>
</table>


### Front End Team
<table align="center">
    <tr>
        <td align="center"> Ali Nix: <a href="https://github.com/alinix1">GitHub</a> | <a href="https://www.linkedin.com/in/ali-nix-38b9b9126/">LinkedIn</a></td>
        <td align="center"> Dana Chapman: <a href="https://github.com/danalchapman">GitHub</a> | <a href="https://www.linkedin.com/in/danalchapman/">LinkedIn</a></td>
        <td align="center"> Emily Miles: <a href="https://github.com/emilyjmiles">GitHub</a> | <a href="https://www.linkedin.com/in/emilyjmiles/">LinkedIn</a></td>
        <td align="center"> Will Hobson: <a href="https://github.com/willhobson85">GitHub</a> | <a href="https://www.linkedin.com/in/the-william-hobson/">LinkedIn</a></td>
    </tr>
 <td align="center"><img src="https://avatars.githubusercontent.com/u/28677929?v=4" alt="Ali Nix GitHub"
 width="150" height="auto" /></td>
 <td align="center"><img src="https://avatars.githubusercontent.com/u/105478792?v=4" alt="Dana Chapman GitHub"
 width="150" height="auto" /></td>
 <td align="center"><img src="https://avatars.githubusercontent.com/u/103063934?v=4" alt="Emily Miles GitHub"
 width="150" height="auto" /></td>
  <td align="center"><img src="https://avatars.githubusercontent.com/u/99286590?v=4" alt="Will Hobson GitHub"
 width="150" height="auto" /></td>
</table>

### Instructor/Project Manager
<table align="center">
    <tr>
        <td align="center"> Kathleen Brandt: <a href="https://github.com/KatBrandt">GitHub</a> | <a href="https://www.linkedin.com/in/katbrandt/">LinkedIn</a></td>
    </tr>
 <td align="center"><img src="https://avatars.githubusercontent.com/u/96136707?v=4" alt="Kat Brandt GitHub"
 width="150" height="auto" /></td>
</table>