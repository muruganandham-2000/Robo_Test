import sqlite3

# Connect to the database (or create a new one if it doesn't exist)
conn = sqlite3.connect("mydatabase.db")

# Create a cursor object to execute SQL commands
cursor = conn.cursor()

# Create a table
cursor.execute("Delete table users")

# Insert data into the table
#cursor.execute("INSERT INTO users (name, age) VALUES (?, ?)", ("Alice", 30))

# Commit the transaction
conn.commit()

# Query the database
cursor.execute("SELECT * FROM users")
data = cursor.fetchall()
print(data)

# Close the cursor and the connection
cursor.close()
conn.close()
