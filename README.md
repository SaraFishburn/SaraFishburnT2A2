# SaraFishburn - T2A2

## Website
https://print3d-society.herokuapp.com/

## Github repo
https://github.com/SaraFishburn/SaraFishburnT2A2

## Trello board
https://trello.com/b/I01qMktP

## ERD


### R7:	Identification of the problem you are trying to solve by building this particular marketplace app.

  Problem: Makers have limited access to 3d printers unless they own one themselves.

### R8:	Why is it a problem that needs solving?

  Currently, in order for someone to use a 3d printer who doesn't own one themselves, they have to rely on educational facilities, local libraries, or friends or family who own a 3d printer.
  In the case of educational facilities and libraries, the printers may have a long wait list of other people looking to print their designs. By creating a 3d printing marketplace that connects local 3d printer owners with people looking to print, the strain on library and educational resources is lessened and access to 3d printers more convenient to the general public.

  3d printers are incredibly versatile with the capability to print anything including practical prints such as household products, prints that replace broken items (doorknobs, battery covers, etc), or just novelty and hobby prints (pop culture figures, RPG gaming minis and terrain, etc). 3d printers may even be used for medical purposes such as cost-friendly prosthetic limbs. Due to their versatility, increased and improved access to 3d printers can both reduce carbon emissions and reduce waste by removing the need to ship products that may be printed and therefore eliminate packaging as well.

  Removing the access restriction for local creators and inventors unleashes an entirely new avenue for creativity and design that could result in great leaps and bounds in a plethora of industries.

### R11:	Description of your marketplace app (website), including:

  * Purpose
  
    The purpose of Print3d is to connect makers who do not have access to 3d printers with 3d printer owners in their community. 

  * Functionality and features

    - Login

      For users to access the application, they must first create an account that includes their email, password, name, and nickname.

    - Owner search

      Once logged in, users are able to enter an address into a search bar to find 3d printer owners. The search bar features a 'location range' filter and 'printer type' filter for users to narrow their search.
    
    - Owner profile features

      The search results from the owner search display owner 'cards' that feature the owner's profile picture, their public name (first name or nickname is they have one), the printer they own, their location (suburb and postcode), and their star rating based on reviews received from other makers who have used their services.

      When a user selects one of these owner cards, they are redirected to the owner's profile which has the information also found on their owner card as well as more in depth information on the printers they own, the filaments and resins they have a available, and the individual reviews they have received. 
      
      Additionally, the owner profile page has a button to start a chat with the owner and a button to make a review for the owner.

    - Messages

      When the chat button on the owner profile is selected, an instant messaging chatroom with the user and the owner is created and the user is redirected to their messages page.

    - Reviews

      when the review button is selected on the owners profile, users are redirected to a form which allows the input of a star rating and a feedback message.

    - User Account

      The user account page contains a form and a call to action button for the user to become an owner. Once selected the user may add their address to their account and they will be made an owner. This unlocks a 'printers' and 'filaments' section on the account page.

      The printers and filaments sections both feature add buttons to create a printer or filament, as well as a delete button to remove a printer or filament.

  * Sitemap

    ![Print3D Site Map](docs/Print3D_site_map.png)

  * Screenshots
  * Target audience
  Two main target audiences: 
  - People looking to 3d print something who do not have easy access to a 3d printer
  - owners of 3d printers who would like to make some money with their printer when they aren't using it for themselves

  * Tech stack (e.g. html, css, deployment platform, etc)

  Front end:
    - SCSS
    - HTML
    - Javascript
  
  Back end:
    - Ruby on rails
  
  Deployment:
    - Heroku
  
  Source control:
    - Git
    - Github

### R12:	User stories for your app
### R13:	Wireframes for your app
### R14:	An ERD for your app
### R15:	Explain the different high-level components (abstractions) in your app
### R16:	Detail any third party services that your app will use

  - Google fonts

### R17:	Describe your projects models in terms of the relationships (active record associations) they have with each other
### R18:	Discuss the database relations to be implemented in your application
### R19:	Provide your database schema design
### R20:	Describe the way tasks are allocated and tracked in your project