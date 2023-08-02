function init_mypy --description "add .mypy.ini file to the current working directory"
    echo -e '[mypy] \npython_executable = "/Users/kiarash/projects/brenntag/data-products-infra/.venv/lib/python3.9/site-packages"' > .mypy.ini
    echo '.mypy.ini file succesfully added to the current working directory.'
end
