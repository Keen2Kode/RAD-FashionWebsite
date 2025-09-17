# Rapid Application Development: Fashion Website

(Pre-LLM era) A full-stack Ruby on Rails e-commerce website, built as a rapid two-month project for university. The app demonstrates end-to-end web development with authentication, mailing, and containerized deployment support.

Click [here](https://rad-fashion.up.railway.app/) to view the deployed app.

---

## Quick Start (Run Locally)

1. Clone the repo  
   ```bash
   git clone https://github.com/yourusername/your-repo.git
   cd your-repo
   ```
2. Build and start the containers  
   ```bash
   docker-compose up --build
   ```
3. Visit the app at  
   [http://localhost:3000](http://localhost:3000)

---

## The Full-Stack

### Backend
* **Ruby on Rails** (Ruby 2.7, Rails 5.2)
* **PostgreSQL** database with ActiveRecord ORM
* Auth via **bcrypt + OmniAuth-Twitter**
* Mail via **SendGrid** (Action Mailer)

### Frontend
* **Bootstrap-based UI** with ERB templates, SCSS, jQuery, Turbolinks

### Testing
- **Minitest** — Unit & Integration Testing
- **Capybara + Selenium/Chromedriver** — System Testing

### Deployment
* **Docker** containerization
* **Railway** hosting (Heroku-compatible)

---

**Features:** [Full specifications](RAD-Assignment-2021-PDF.pdf)

**Level Scored:** 90+ (Multiple Browser feature, admin feature)

---

**Notes:** 
* This is no longer actively maintained, so some features may not work as intended.
* During our project duration (2020), no code generators were used.



