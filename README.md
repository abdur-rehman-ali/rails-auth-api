
# Blog API with authentication and authorization

This is a simple Rails application that provides a user authentication API using devise jwt-token, CRUD functionality for Blogs, and only admin and author can update or destroy the blog. We will be using user devise, devise_jwt, annotation, pundit, and active_model_serialziers for this application.


## Getting Started

* Ruby version 2.7.2
* Rails version 6.1
## Installation

To get started, clone the repository and install the dependencies:

```bash
git clone https://github.com/abdur-rehman-ali/rails-auth-api.git
cd rails-auth-api
bundle install
rails db:create
rails db:migrate
rails db:seed

```
This will create the necessary database and seed the database with some sample data.


    
## Running the application
To run the application, start the Rails server:

``` bash 
rails s
```
The application will be available at http://localhost:3000/
## API Reference

### Users 

| Endpoint | Method     | Description                |
| :-------- | :------- | :------------------------- |
| `/users/sign_up` | `POST` | Sign in with email, username and password. Returns JWT token. |
| `/users/sign_in` | `POST` | Log in with email and password. Returns JWT token. |
| `/users/sign_out` | `DELETE` | Log out user and expire the JWT |

### Blogs

| Endpoint | Method     | Description                |
| :-------- | :------- | :------------------------- |
| `/api/v1/blogs` | `GET` | List all blogs. |
| `/api/v1/blogs/:id` | `GET` | Get a specific blog. |
| `/api/v1/blogs` | `POST` | Create a new blog after logging in. |
| `/api/v1/blogs/:id` | `PUT` | Update an existing blog. Only admin and author can update it. |
| `/api/v1/blogs/:id` | `DELETE` | Delete an existing blog. Only admin and author can update it. |



## Authentication

To authenticate a user, make a POST request to `/users/sign_in` with email and password as the parameters. The response will include a JWT token that can be used for subsequent requests.
## Authorization

To authorize a user, we are using Pundit. Only admin and author can update or destroy the blog. If a user is not authorized to perform an action, a `Pundit::NotAuthorizedError` is raised, and the application will return a 401 Unauthorized response.


## Testing the API Endpoints

We recommend using Postman to test the API endpoints. To test the authentication endpoint, make a POST request to `users/sign_in` with email and password as the parameters. To test other endpoints, include the JWT token in the request headers under the Authorization key.


## Gems Used

- devise
- devise-jwt
- active_model_serializers
- annotate
- pundit


## Lessons Learned

I built a RESTful API with proper authentication and authorization, and ensured strong security to prevent unauthorized access to protected routes.


## Conclusion
This is a simple Rails application that provides user authentication API using devise jwt-token, CRUD functionality for Blogs, and only admin and author can update or destroy the blog. The application uses user devise, devise_jwt, annotation, pundit, and active_model_serialziers. Feel free to use this application as a starting point for your own Rails projects.