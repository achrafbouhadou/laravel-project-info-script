# Laravel Project Info Script

This script provides detailed information about a Laravel project's models, database tables, and generates a project summary. It helps Laravel users to give a clear prompt to AI or others to understand how their project works.

## Description

The Laravel Project Info Script is designed to help developers quickly extract and understand the structure and relationships within their Laravel projects. By generating a comprehensive overview of the project's models and database schema, it makes it easier to communicate the project's details to AI systems, team members, or for documentation purposes.

## Usage

1. **Clone this repository** to your Laravel project root directory:
   ```bash
   git clone https://github.com/achrafbouhadou/laravel-project-info-script.git
   cd laravel-project-info-script
 bash```
 
 ### 2. Make the script executable:
   ```bash
   chmod +x project_info.sh
   bash```

 ### 3. Run the script:
   ``bash
   ./project_info.sh
 bash``

 4. **Example Output** 
   ``bash
   ============================================================
Models and Relationships:
Model: App\Models\User
 - posts()
 - comments()

Model: App\Models\Post
 - user()
 - comments()

...

============================================================
Database Tables and Schema Details:
Table: users
 - id (bigint unsigned)
 - name (varchar(255))
 - email (varchar(255))
 - created_at (timestamp)
 - updated_at (timestamp)

Table: posts
 - id (bigint unsigned)
 - user_id (bigint unsigned)
 - title (varchar(255))
 - content (text)
 - created_at (timestamp)
 - updated_at (timestamp)

...

============================================================
Project Summary:
This Laravel project contains 15 models and 20 database tables.
It includes functionality for user management, e-commerce operations, and more.

 bash``

 
