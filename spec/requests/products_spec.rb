require "rails_helper"

RSpec.describe "Products", type: :request, clean_db: true do
  let!(:product) { create(:product) }

  describe "GET /products" do
    it "lists products" do
      get products_path
      expect(response).to have_http_status(:ok)
      expect(response.body).to include(product.name)
    end
  end

  describe "GET /products/:id" do
    it "shows a product" do
      get product_path(product)
      expect(response).to have_http_status(:ok)
    end
  end

  describe "GET /products/new" do
    it "renders the form" do
      get new_product_path
      expect(response).to have_http_status(:ok)
    end
  end

  describe "POST /products" do
    it "creates a product and redirects" do
      expect {
        post products_path, params: { product: { name: "Lamp", inventory_count: 2 } }
      }.to change(Product, :count).by(1)
      expect(response).to redirect_to(product_path(Product.last))
    end

    it "re-renders with errors on invalid input" do
      post products_path, params: { product: { name: "", inventory_count: 2 } }
      expect(response).to have_http_status(:unprocessable_entity)
    end
  end

  describe "GET /products/:id/edit" do
    it "renders the form" do
      get edit_product_path(product)
      expect(response).to have_http_status(:ok)
    end
  end

  describe "PATCH /products/:id" do
    it "updates and redirects" do
      patch product_path(product), params: { product: { name: "Renamed" } }
      expect(response).to redirect_to(product_path(product))
      expect(product.reload.name).to eq("Renamed")
    end

    it "re-renders with errors on invalid input" do
      patch product_path(product), params: { product: { inventory_count: -5 } }
      expect(response).to have_http_status(:unprocessable_entity)
    end
  end

  describe "DELETE /products/:id" do
    it "destroys and redirects with a flash" do
      expect { delete product_path(product) }.to change(Product, :count).by(-1)
      expect(response).to redirect_to(products_path)
      expect(flash[:notice]).to be_present
    end
  end
end
