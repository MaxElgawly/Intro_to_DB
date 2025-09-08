import mysql.connector

def create_database():
    connection = None
    try:
        # Connect to MySQL server (update credentials)
        connection = mysql.connector.connect(
            host="localhost",
            user="root",        # change to your MySQL username
            password="password" # change to your MySQL password
        )

        if connection.is_connected():
            cursor = connection.cursor()
            # Create database if it does not exist
            cursor.execute("CREATE DATABASE IF NOT EXISTS alx_book_store")
            print("Database 'alx_book_store' created successfully!")

    except mysql.connector.Error as e:
        print(f"Error while connecting to MySQL: {e}")

    finally:
        if connection and connection.is_connected():
            cursor.close()
            connection.close()

if __name__ == "__main__":
    create_database()
