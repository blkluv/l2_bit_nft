CREATE OR REPLACE FUNCTION public.trigger_transfer_on_bid()
 RETURNS trigger
 LANGUAGE plpgsql
AS $function$
BEGIN
         UPDATE artworks a
         SET owner_id = NEW.user_id
         WHERE a.id = NEW.artwork_id
         AND a.list_price is not null
         AND a.list_price <= NEW.amount;
END;
$function$;
