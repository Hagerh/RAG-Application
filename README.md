# RAG Project
A Retrieval-Augmented Generation (RAG) application that combines web search, document ranking, and LLM responses into a chat interface. The project has two parts:

* **Backend (Python, FastAPI/WebSocket)** → Search, filter, and rank documents, then use an LLM (Gemini) for responses.
* **Frontend (Flutter)** → Interactive UI for querying, showing answers, sources, and chat history.

## Features
### Backend (Python)
#### Search Service (search_service.py)

* Uses Tavily API to fetch search results
* Extracts main content from webpages using Trafilatura
* Supports max_results parameter for controlling results

#### Resource Sorting (sortResources_service.py)

* Converts query and documents into embeddings
* Calculates cosine similarity to rank results by relevance
* Adds relevance_score to results and sorts them

#### LLM Service (llm_service.py)

* Connects to Google Gemini API
* Creates a context from retrieved documents
* Streams responses chunk by chunk via WebSocket

#### WebSocket API (main.py)

* Endpoint: /ws/chat
* Accepts query requests
* Streams real-time LLM responses (type: content)
* Sends completion and error messages (type: complete / type: error)


#### Models (chat_body.py)

Pydantic models for request/response validation

### Frontend (Flutter)
#### UI Screens

chat_page.dart → Main chat interface
rag_screen.dart → Display RAG results

#### Widgets

**answer.widget.dart** → Displays streamed LLM answers
**sources.widget.dart** → Shows ranked sources with title + URL
**search.widget.dart + searchButtons.widget.dart** → Search UI components
**sideBar.widget.dart + sideBarButtons.widget.dart** → Sidebar navigation

#### Constants

**colors.dart** → Centralized theme & color palette

## Tech Stack

* **Backend**: Python, FastAPI, WebSocket, Tavily API, Trafilatura, NumPy, Google Generative AI
* **Frontend**: Flutter (Dart)
* **Other**: Pydantic, dotenv for config management
