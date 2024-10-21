---
layout: page
title: ESL Learning Assistant
description: Web app that can assist ESL (English Second Language) learners in improving grammar accuracy and reading comprehension skills.
img: assets/img/12.jpg
importance: 1
category: work
related_publications: true
---

The ESL Learning Assistant is a Flask-based web application designed to help English as a Second Language (ESL) learners improve their language skills. This interactive tool offers a range of features to enhance English proficiency, including grammar correction, article reading comprehension, and AI-powered Q&A sessions.

**Note:** Currently, the functionalities of this application are not working as intended due to the backend not being hosted at the moment. The project is still under development, and full functionality will be restored once hosting issues are resolved.

## Key Features

### Grammar Correction

- Analyzes user input for grammatical errors
- Provides corrections with detailed explanations
- Helps learners understand and improve their writing skills

### Article Reading Comprehension

- Fetches random news articles for reading practice
- Generates comprehension questions based on article content
- Offers both multiple-choice and short answer questions

### Interactive Q&A Sessions

- Allows users to engage in dynamic question-and-answer interactions
- Powered by AI to provide accurate and helpful responses
- Enhances conversational skills and vocabulary

### Conversation Storage

- Saves user interactions for future reference
- Enables learners to track their progress over time

## Technology Stack

- **Backend Framework:** Flask
- **Frontend:** HTML, CSS, JavaScript
- **Cross-Origin Resource Sharing:** CORS
- **String Matching:** FuzzyWuzzy
- **News Article Fetching:** PyGoogleNews
- **Article Parsing:** Newspaper3k
- **Natural Language Processing:** NLTK
- **API Calls:** Requests library
- **AI Text Processing:** Mixtral API

## Setup and Installation

1. Clone the repository:

> git clone https://github.com/Jeybird248/ESL-web-app.git

2. Navigate to the project directory:

> cd ESL-web-app

3. Install required dependencies:

> pip install -r requirements.txt

4. Set up environment variables:

- MIXTRAL_URL: URL for the Mixtral API
- MIXTRAL_USERNAME: Your Mixtral API username
- MIXTRAL_PASSWORD: Your Mixtral API password

5. Run the Flask application:

> python app.py

6. Access the application at `http://localhost:5000`

## API Endpoints

- `/`: Home page
- `/grammar`: Grammar correction page
- `/article`: Article reading page
- `/about`: About page
- `/fetch_article_text`: Fetches and processes a random news article
- `/submit`: Handles user input for grammar correction and Q&A

## Current Limitations

As mentioned earlier, the application's functionalities are currently limited due to backend hosting issues. Users may experience:

- Inability to perform grammar corrections
- Failure to fetch new articles
- Non-functional Q&A sessions

We are actively working on resolving these issues to provide a fully functional learning experience.

## Contributing

Contributions to improve the ESL Learning Assistant are welcome. Please feel free to submit pull requests or open issues for bugs and feature requests.

## License

This project is licensed under the MIT License.

## Acknowledgements

- Mixtral API for AI-powered text processing
- PyGoogleNews for news article fetching
- Newspaper3k for article parsing

For any queries or suggestions, please open an issue on the GitHub repository.
