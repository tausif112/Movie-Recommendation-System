# 🎬 Movie Recommendation Knowledge-Based System

## 📌 Project Information

A knowledge-based movie recommendation system built using Prolog and expert system concepts.

---

## 👨‍💻 Project Overview

This project is a Prolog-based Movie Recommendation System that uses a knowledge-based expert system approach to provide personalized movie recommendations. The system uses a **knowledge-based expert system approach** to provide personalized movie recommendations for users.

The recommendation engine combines:
- Genre-based recommendation
- Director-based recommendation
- Collaborative filtering
- User similarity analysis

The project demonstrates how Artificial Intelligence concepts and logical reasoning can be implemented using **Prolog**.

---

## 🎯 Objectives

The main objectives of this project are:

- To build a movie recommendation expert system using Prolog
- To implement logical rules for intelligent decision making
- To analyze user preferences and ratings
- To generate personalized movie suggestions
- To demonstrate collaborative filtering concepts

---

# ⚙️ Technologies Used

| Technology | Purpose |
|------------|----------|
| Prolog | Knowledge representation and logical reasoning |
| SWI-Prolog | Running and testing the system |
| GitHub | Version control and project hosting |

---

# 🧠 System Features

## ✅ Movie Knowledge Base
Stores movie information including:
- Movie name
- Genre
- Director

Example:
```prolog
movie(inception, scifi, nolan).
```

---

## ✅ User Preferences
Stores:
- Preferred genres
- Preferred directors

Example:
```prolog
prefers_genre(user_a, scifi).
prefers_director(user_a, nolan).
```

---

## ✅ Ratings System
Users can rate movies on a scale from 1–5.

Example:
```prolog
rating(user_a, inception, 4).
```

---

## ✅ Genre-Based Recommendation
Suggests movies based on the user's favorite genres.

---

## ✅ Director-Based Recommendation
Suggests movies directed by preferred directors.

---

## ✅ Collaborative Filtering
The system identifies users with similar tastes by comparing ratings and recommends highly rated movies from similar users.

---

## ✅ Similarity Analysis
Calculates:
- Shared movies between users
- Rating similarity
- Average similarity score

---

# 📂 Project Structure

```text
Movie-Recommendation-System/
│
├── prolog.pl
├── LICENSE
└── README.md
```

---

# ▶️ How to Run

## Step 1: Install SWI-Prolog

Download from:
https://www.swi-prolog.org/

---

## Step 2: Open SWI-Prolog

Load the Prolog file:

```prolog
[prolog].
```

---

## Step 3: Run Queries

### Genre Recommendation
```prolog
recommend_genre(user_a, Movie).
```

### Director Recommendation
```prolog
recommend_director(user_a, Movie).
```

### Collaborative Recommendation
```prolog
recommend_collaborative(user_a, Movie).
```

### All Recommendations
```prolog
recommend(user_a, Movie).
```

### Recommendations Without Duplicates
```prolog
recommend_no_duplicates(user_a, Movie).
```

---

# 📊 Sample Output

Example:

```prolog
?- recommend_director(user_a, Movie).

Movie = inception ;
Movie = interstellar ;
Movie = dark_knight.
```

---

# 🚧 Challenges Faced

- Managing recommendation duplicates
- Handling sparse rating data
- Calculating user similarity efficiently
- Maintaining modular and reusable rules

---

# 📚 AI Concepts Used

- Knowledge Representation
- Rule-Based Expert System
- Logical Inference
- Collaborative Filtering
- Similarity Measurement

---

# 📖 Conclusion

The project successfully demonstrates how Artificial Intelligence techniques and logical programming can be used to create an intelligent movie recommendation system. The modular design allows easy scalability by adding more users, movies, and recommendation rules in the future.

---

# 👨‍🎓 Author

**Md Tausif Uddin**  
Department of Computer Science and Engineering (CSE) 
University of Asia Pacific (UAP)

GitHub: https://github.com/tausif112

---

# 📜 License

This project is licensed under the MIT License.
