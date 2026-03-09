# 🧠 AI News Intelligence Platform

AI News Intelligence Platform is a **real-time AI-powered news dashboard** that aggregates global news and provides quick insights using lightweight NLP techniques.

The platform retrieves live news from **NewsAPI** and automatically switches to **RSS feed fallback** when API rate limits are reached, ensuring uninterrupted access to news data.

The application is built with **Python and Streamlit** and deployed on **Streamlit Community Cloud**.

---

# 🚀 Live Demo

### 🌐 Application
https://ai-news-assistant.streamlit.app/

### 📁 GitHub Repository
https://github.com/YuvarajOfl/ai-news-assistant

---

# 📌 Project Overview

This project demonstrates how **AI-powered news analysis platforms** can be built using lightweight Python tools.

The system collects news from multiple sources and provides:

- summarized insights
- sentiment indicators
- categorized news browsing
- trending headlines
- reliable fallback mechanisms

The goal is to create a **fast, lightweight news intelligence dashboard** that allows users to quickly understand global events.

---

## 📷 Application Preview


<img width="1920" height="1080" alt="Screenshot (265)" src="https://github.com/user-attachments/assets/efdff917-10db-407e-8599-86b96c983729" />

<img width="1920" height="1080" alt="Screenshot (266)" src="https://github.com/user-attachments/assets/9643a967-614e-42fb-afc5-4f4ff8e27609" />

<img width="1920" height="1080" alt="image" src="https://github.com/user-attachments/assets/3391a24e-833a-42b1-9ebb-5d7544ea193e" />


- Home page
- News results
- Summarized output

---

# ✨ Core Features

### 📰 Real-Time News Aggregation
Fetches live news articles using NewsAPI based on user queries.

### 🔄 RSS Feed Fallback
Automatically switches to RSS feeds when NewsAPI rate limits are reached to ensure **continuous data availability**.

### 🧠 Sentiment Tagging
Uses lightweight NLP techniques to classify article tone:

- Positive
- Neutral
- Negative

### 📂 Category-Based Navigation
Users can explore news across multiple domains:

- General
- Technology
- Business
- Science
- Health
- Sports
- Entertainment
- Gaming
- Movies

### ⚡ Quick Read Section
A sidebar highlights trending headlines for fast scanning.

### 🖼 Article Cards
Each article is displayed as a visual card containing:

- news image
- headline
- short summary
- source
- article link

### ⚙ Adjustable Filters
Users can:

- search by topic
- select categories
- control the number of articles displayed

### ☁️ Cloud Deployment
The application is deployed and publicly accessible via Streamlit Cloud.

---

# 🏗 System Architecture

```
User Query
     │
     ▼
Streamlit Web Interface
     │
     ▼
NewsAPI Request
     │
     ├── If Rate Limit Reached
     ▼
RSS Feed Fallback
     │
     ▼
NLP Processing
(Sentiment + Summary)
     │
     ▼
Interactive News Dashboard
```

---

# 🧰 Technology Stack

| Technology | Purpose |
|------------|--------|
| Python | Core application logic |
| Streamlit | Web dashboard interface |
| NewsAPI | Real-time news retrieval |
| RSS Feeds | Backup data source |
| NLP Techniques | Sentiment tagging |
| REST APIs | Data integration |
| GitHub | Version control |
| Streamlit Cloud | Deployment platform |

---

# 📂 Project Structure

```
ai-news-assistant
│
├── app.py
├── config.py
├── requirements.txt
├── README.md
└── assets
     └── dashboard.png
```

---

# ⚙ Installation

### 1️⃣ Clone Repository

```bash
git clone https://github.com/YuvarajOfl/ai-news-assistant.git
```

### 2️⃣ Navigate to Project

```bash
cd ai-news-assistant
```

### 3️⃣ Install Dependencies

```bash
pip install -r requirements.txt
```

### 4️⃣ Run Application

```bash
streamlit run app.py
```

---

# 🔑 Environment Setup

Create an environment variable for the NewsAPI key.

```
NEWS_API_KEY=your_api_key_here
```

You can obtain a free API key from:

https://newsapi.org

---

# ☁️ Deployment

The project is deployed on **Streamlit Community Cloud**.

Deployment steps:

1. Push project to GitHub  
2. Connect repository to Streamlit Cloud  
3. Add `NEWS_API_KEY` in Streamlit Secrets  
4. Deploy the application  

The platform becomes publicly accessible through a live URL.

---

# 💡 Use Cases

This platform can be used for:

- real-time news monitoring
- quick news sentiment analysis
- AI-assisted news summarization
- lightweight data dashboard development
- demonstrating API-based data products

---

# 📈 Future Improvements

Potential enhancements include:

- advanced AI summarization models
- trending topic extraction
- news analytics dashboard
- topic recommendation system
- user bookmarking and saved articles

---

## 👨‍💻 Author

Yuvaraj T

📧 Email: Yuvicardy18@gmail.com  
🐙 GitHub: https://github.com/YuvarajOfl  
💼 LinkedIn: https://www.linkedin.com/in/yuvaraj8/

---

# ⭐ Support

If you find this project useful, consider giving it a **star on GitHub** ⭐

---

# 📜 License

This project is licensed under the **MIT License**.
