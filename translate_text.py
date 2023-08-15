import openai
import os
import sys

# Your OpenAI API key
OPENAI_API_KEY = os.getenv("OPENAI_API_KEY")

# Ensure API key is present
if not OPENAI_API_KEY:
    raise ValueError(
        "Missing OpenAI API key. Please set it as an environment variable.")

openai.api_key = OPENAI_API_KEY

# Get the text to translate from command-line argument
text_to_translate = sys.argv[1]

# Check if the text is empty to avoid unnecessary API call
if not text_to_translate.strip():
    print("No text to translate.")
    sys.exit(0)

# Prompt to explain the text in plain language
prompt = f"請用白話解釋以下的正體中文文本：'{text_to_translate}'"

# Translate the text using OpenAI API
response = openai.Completion.create(
    engine="gpt-4.0-turbo",
    prompt=prompt,
    max_tokens=150  # Increased max_tokens to allow for more nuanced explanation
)

# Extract and print the translated text
translated_text = response.choices[0].text
print(translated_text)
