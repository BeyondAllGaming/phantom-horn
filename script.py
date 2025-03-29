# example script.py
# this is gonna open firefox and navigate to duckduckgo.com
import os
import time
import pyautogui
from selenium import webdriver
from selenium.webdriver.firefox.options import Options


def main():
    # Firefox options
    options = Options()

    options.headless = False  # Set to true if you want the browser to not be rendered

    # Initialize the Firefox WebDriver (ensure geckodriver is in your PATH)
    # The PATH thing is done in the Dockerfile tar unpacking at `-C /usr/local/bin`
    driver = webdriver.Firefox(options=options)

    # Open DuckDuckGo
    driver.get("https://duckduckgo.com")

    # Print the title of the page to confirm it's loaded
    print("Page title:", driver.title)

    # Wait until keypress to exit
    try:
        while True:
            time.sleep(60)
    except KeyboardInterrupt:
        driver.quit()


if __name__ == "__main__":
    main()
