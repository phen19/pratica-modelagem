CREATE TABLE "public.Users" (
	"id" serial NOT NULL,
	"name" serial NOT NULL,
	"email" serial NOT NULL UNIQUE,
	"password" serial NOT NULL,
	"address" serial NOT NULL,
	CONSTRAINT "Users_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.Products" (
	"id" serial NOT NULL,
	"name" TEXT NOT NULL,
	"price" bigint NOT NULL,
	"picturesId" integer NOT NULL,
	"categoryId" integer NOT NULL,
	CONSTRAINT "Products_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.Category" (
	"id" serial NOT NULL,
	"name" TEXT NOT NULL,
	CONSTRAINT "Category_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.Orders" (
	"id" serial NOT NULL,
	"status" TEXT NOT NULL DEFAULT 'created',
	"userId" int NOT NULL,
	"address" TEXT NOT NULL,
	"purchaseDate" DATE NOT NULL DEFAULT 'now()',
	"productId" integer NOT NULL,
	"productPrice" bigint NOT NULL,
	"quantity" integer NOT NULL,
	"secondProductPrice" bigint,
	"secondProductQuantity" integer,
	"secondProductId" integer,
	CONSTRAINT "Orders_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.Pictures" (
	"id" serial NOT NULL,
	"primary" TEXT NOT NULL,
	"secundary" TEXT,
	CONSTRAINT "Pictures_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);




ALTER TABLE "Products" ADD CONSTRAINT "Products_fk0" FOREIGN KEY ("picturesId") REFERENCES "Pictures"("id");
ALTER TABLE "Products" ADD CONSTRAINT "Products_fk1" FOREIGN KEY ("categoryId") REFERENCES "Category"("id");


ALTER TABLE "Orders" ADD CONSTRAINT "Orders_fk0" FOREIGN KEY ("userId") REFERENCES "Users"("id");
ALTER TABLE "Orders" ADD CONSTRAINT "Orders_fk1" FOREIGN KEY ("address") REFERENCES "Users"("address");
ALTER TABLE "Orders" ADD CONSTRAINT "Orders_fk2" FOREIGN KEY ("productId") REFERENCES "Products"("id");
ALTER TABLE "Orders" ADD CONSTRAINT "Orders_fk3" FOREIGN KEY ("productPrice") REFERENCES "Products"("price");
ALTER TABLE "Orders" ADD CONSTRAINT "Orders_fk4" FOREIGN KEY ("secondProductPrice") REFERENCES "Products"("price");
ALTER TABLE "Orders" ADD CONSTRAINT "Orders_fk5" FOREIGN KEY ("secondProductId") REFERENCES "Products"("id");







