# Rapid Application Development: Fashion Website

(Pre-LLM era) A full-stack Ruby on Rails e-commerce website, built as a rapid two-month project for university. The app demonstrates end-to-end web development with authentication, mailing, and containerized deployment support.

Click [here](https://rad-fashion.up.railway.app/) to view the deployed app. ([App not working?](#notes))




<div align="left">
  <img src="other documents/readme images/rad 1.png" alt="Screenshot 1" width="22%" style="margin-right: 1%;"/>
  <img src="other documents/readme images/rad 2.png" alt="Screenshot 2" width="22%" style="margin-right: 1%;"/>
  <img src="other documents/readme images/rad 3.png" alt="Screenshot 3" width="22%" style="margin-right: 1%;"/>
  <img src="other documents/readme images/rad 4.png" alt="Screenshot 4" width="22%"/>
</div>


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

### Features ([Full specifications](RAD-Assignment-2021-PDF.pdf) - Scored 80+)
> ⚠️ **Disclaimer**  
> As a currently inactive legacy uni project, some features may not work as intended.


* **Homepage & Browsing**

  * Random featured item banner, “Popular” items, and category navigation (Women, Men, Kids, New Arrivals).
  * Filtering by tags, color, and size.
  * Incremental search with live results.

* **Saved Items & Favorites**

  * Toggle items in a personal “Saved List,” persisted across sessions/devices.
  * Favorite icon always visible for quick add/remove.
  * Popularity scores update based on saves + purchases.

* **Product Details & Shopping Bag**

  * Product detail pages with multiple images, size/color/quantity selectors.
  * Add to shopping bag (with swipe-to-delete support).
  * Shopping bag synced across devices and browsers.

* **User Accounts & Authentication**

  * Signup/login with validations (email, password length & confirmation).
  * Login via Twitter OAuth.
  * Password recovery via email link.
  * Profile page with Gravatar, account update, newsletter toggle, and logout.
  * DIY login/signup flow (no external auth gems like Devise).

* **Checkout & Orders**

  * Bag shows total items and clears on checkout (transaction simulated).
  * Post-checkout rating page shown once per new user.
  * Pending orders persist across logins.

* **Newsletter & Email Integration**

  * Subscription with input validation.
  * Confirmation/notification emails sent via SendGrid.


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

#### Notes
* During our project duration (2020), no code generators were used.
* If the site is down, you can request a boot up at my [email](mailto:reuben.rajeev@gmail.com).

