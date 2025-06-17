from webdriver_manager.chrome import ChromeDriverManager

driver_path = ChromeDriverManager().install()
print(f"ChromeDriver atualizado. Caminho: {driver_path}")
