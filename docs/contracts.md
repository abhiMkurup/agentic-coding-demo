# Interface Contracts (SH-1)

## Routes
- resources :products
- Subscribe: POST /products/:product_id/subscribers (nested; param key :subscriber)
- Unsubscribe: GET /unsubscribe/:token → UnsubscribesController#show
- Auth (BE-6): /login, /logout via SessionsController

## Partials & locals
- Login/logout slot: app/views/shared/_auth_links.html.erb
  (FE-1 renders a placeholder version; BE-6 replaces its contents. Same name.)
- Inventory/subscribe: app/views/products/_inventory.html.erb,
  locals: { product: } (FE-4 owns it; show.html.erb renders it)

## I18n
- Keys: <view>.<element>, e.g. products.index.title — under config/locales/{en,es}.yml

## Shared-file ownership
- config/routes.rb: additions only, one ticket at a time, in dependency order
- db/schema.rb: migrations only, one migration ticket in flight at a time
