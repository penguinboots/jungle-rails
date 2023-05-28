describe('product details page', () => {

  it('can visit the homepage', () => {
    cy.visit('/');
  });

  it('can add a product to the cart to increase cart count', () => {
    cy.contains('My Cart (0)');
    cy.contains('Add').first().click({ force: true });
    cy.contains('My Cart (1)');
  });

});