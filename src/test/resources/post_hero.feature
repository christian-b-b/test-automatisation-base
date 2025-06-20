@REQ_BTPMCDP-02 @HU02 @marvel-characters @Agente2 @E2
Feature: BTPMCDP-02 post Marvel characters

  Background:
    * configure ssl = true

  @id:1 @postHero @successfullRequest201
  Scenario: create hero successfully responds 201
    Given url 'http://bp-se-test-cabcd9b246a5.herokuapp.com/testuser/api/characters'
    And request
      """
      {
        "name": "Iron Mansoioi",
        "alterego": "Tony Stark",
        "description": "Genius billionaire",
        "powers": ["Armor", "Flight"]
      }
      """
    When method post
    Then status 201
    And match response == { id: '#number', name: 'Iron Mansoioi', alterego: 'Tony Stark', description: 'Genius billionaire', powers: ['Armor', 'Flight'] }

  @id:2 @postHero @duplicateName400
  Scenario: crear personaje con nombre duplicado responde 400
    Given url 'http://bp-se-test-cabcd9b246a5.herokuapp.com/testuser/api/characters'
    And request
      """
      {
        "name": "Iron Manso",
        "alterego": "Otro",
        "description": "Otro",
        "powers": ["Armor"]
      }
      """
    When method post
    Then status 400
    And match response == { error: 'Character name already exists' }

  @id:3 @postHero @missingFields400
  Scenario: crear personaje con campos requeridos faltantes responde 400
    Given url 'http://bp-se-test-cabcd9b246a5.herokuapp.com/testuser/api/characters'
    And request
      """
      {
        "name": "",
        "alterego": "",
        "description": "",
        "powers": []
      }
      """
    When method post
    Then status 400
    And match response == { "name": "Name is required", "alterego": "Alterego is required", "description": "Description is required", "powers": "Powers are required" }
