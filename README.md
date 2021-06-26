# RestFull API for CoronaWatch Project
BACKEND TEAM Members: Bouchafa Lotfi Rafik, Ahmim Naima  
Technological Stack:

    Development: Django, Django Rest Framework  
    Unit Testing: Django Tests   
    Database : Postgresql   
    Deployment: Heroku  
    Continous integration and Deployment: [Travis CI](https://www.travis-ci.com/github/LotfiRafik/coronawatch)
## Specifications
##### Table of Contents  

1. [Introduction](#intro)  
2. [System Layers](#sysl)  
3. [Context](#ctx)  
4. [Terminology](#term)  
5. [Functional Requirements](#fr)  
  5.1 [System Actors](#sysa)  
  5.2 [Specifications](#spec)  
    i) [Mobile Application](#mobileapp)  
    ii) [Web Application](#webapp)  
    iii) [Robots](#robots)  
6. [Non-Functional/Technical Requirements](#tr)  

## <a name="intro"/>1. Introduction  
As part of the 2nd year CS SIL project, we were asked to to develop a system to monitor the global epidemic "Corona Virus".

## <a name="sysl"/>2. System Layers  
The system is composed of the following layers:  
| Layer        | Description   |
| ------------- |:-------------:|
| DATA     | Layer that contains the data of the system. This layer must be made with a known and modern relational or NoSQL DBMS. |
| SERVICES      | This layer contains all the services accessed by the clients. The use of REST technology is required.      |
|WEB CLIENT| A web client accessible by all moderators.    |
|MOBILE CLIENT|The mobile client is the main application used by users.|

## <a name="ctx"/>3. Context    
As part of the global alert launched by the WHO in January 2020, and for the sake of transparency and information flow, the Ministry of Health has created a crisis cell to manage the epidemic. This unit will be referred to as CCC in the rest of this document (Corona Virus Crisis Unit).  
One of the first actions of the crisis cell is to recruit you to make a monitoring and information system on the epidemic through Android mobile applications. For the sake of time and urgency, the Kanban methodology will be applied and the tested and validated features will have to be deployed very quickly.  
For the sake of urgency, the team could not develop detailed specifications. The specifications presented in this document are indicative and the company remains free to propose improvements to the existing functionalities.  

## <a name="term"/>4. Terminology  
| Couche        | Description   |
| ------------- |:-------------:|
| CCC     | Corona Virus Crisis Unit |
| WHO      | World Health Organization |

## <a name="fr"/>5. Functional Requirements 
## <a name="sysa"/>5.1 System Actors
The system is used by the following actors:    
* Moderator: an agent of the Ministry of Health who is in charge of content moderation.  
* User: any user with access to the mobile application 
* Editor: an expert appointed by CCC to write articles  
* Health Officer: a member designated by CCC to use the system and manage health information  

## <a name="spec"/>5.2 Specifications  
The following tables list the feature specifications. Priority ❶ is the highest priority while priority ❺ is the lowest priority.
## <a name="mobileapp"/>i) Mobile Application
| N°        | Specification   | Priority   |
| ------------- |:-------------:|:-------------:|
| 1001     | The user has access to an interactive international map with dashboards targeting the following information: Number of carriers of the virus but not yet ill, Number of suspected cases, Number of confirmed sick cases, Number of deaths, Number of recovered cases | 1   |
| 1002      | The user has access to a news feed that lists articles published by CCC's designated experts  | 1   |
| 1003  | The user has access to another page called "Watch" which consolidates information gathered from the web, YouTube or Facebook pages about the virus     | 1   |
| 1004      | The user can authenticate with a Facebook or Gmail account   | 1   |
| 1005      | The authenticated user can report a suspected case via the mobile application. The report must be accompanied by a photo or a video.   | 3   |
| 1006      | The authenticated user can make a video on the theme with the application and send it for moderation.   | 1   |
| 1007      | The user has access to a page called "Videos of the Internet users" where he can consult the videos posted by other users on the theme.   | 3   |
| 1008      | The user can comment on any content accessible via the mobile application. The comment is immediately validated.  | 3   |
| 1009      | The user has access to an interactive national map with dashboards targeting the following information: - Number of confirmed cases, - Number of deaths, - Number of recovered cases, - Reception center in case of contamination, - Areas at risk   | 1   |
| 1010     | The authenticated user can take a picture of himself and send it to the server which analyzes the picture and sends an alert in case detection of suspicious features   | 5   |

## <a name="webapp"/>ii) Web Application
| N°        | Spécification   | Priorité   |
| ------------- |:-------------:|:-------------:|
| 2001      | The writer has the possibility to write articles with the possibility to format the article and to insert photos and/or videos.   | 1   |
| 2002      | The moderator must have the possibility to validate the articles written by the editors. An article is only visible to users only if it is validated by the moderators.   | 1   |
| 2003      | The moderator must validate the contents extracted by the robots. These contents are accessible to users only after validation | 1   |
| 2004      | The health agent must enter the virus information on the web portal: - Risk areas, - Number of deaths, recoveries, confirmed cases by region This information is mainly used on the interactive maps.    | 1   |
| 2005      | The moderator must validate all information entered by the health workers    | 1   |
| 2006      | The moderator receives an email for each reported case. He must then validate the reported cases on the web application. Each each time a case is validated, the case is sent by email to the members of the CCC.    | 1   |
| 2007      | The moderator must validate the videos submitted by the users of the application.    | 3  |
| 2008      | The moderator can delete a comment deemed inappropriate    | 3   |

## <a name="robots"/>iii) Robots  
| N°        | Spécification   | Priorité   |
| ------------- |:-------------:|:-------------:|
| 3001      | The robot must extract the last publications of Facebook pages (configurable) on the theme    | 1   |
| 3002      | The robot must extract the latest publications of YouTube videos on the theme    | 1   |
| 3003      | The robot must extract the latest publications from websites whose list is set up    | 2   |  

## <a name="tr"/>6. Non-Functional/Technical Requirements  
* The system must be developed on the basis of an SOA architecture.
* The backend must be based on containers and Docker
* The mobile application must have Arabic as its main language
* All operations must be logged in backend log files
* Use Kubernetes for container orchestration
* Design must be user friendly and well thought out. An important note will be given to the graphical interface.
* Security: The system must be secure and impervious to computer attacks.
* The web client must be developed with Angular 9 or React JS.
* Android is the system of the mobile client.
* The data is only on the server side.
* Unit tests on the server side.
* On the client side use Karma / Jasmine for unit tests.
