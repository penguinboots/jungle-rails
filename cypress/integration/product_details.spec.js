describe('product details page', () => {

  it('can visit the homepage', () => {
    cy.visit('/');
  });

  it('can visit the selected product page', () => {
    cy.visit('/');
    cy.get(".products article").first().click();
    cy.url().should("include", "/products/2");
  });

});