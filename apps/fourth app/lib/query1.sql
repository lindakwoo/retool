SELECT * FROM test_employees
WHERE id = {{ id_input.value }}
  AND department = {{ dept_input.value }}
  AND role_id = {{ role_input.value }}
