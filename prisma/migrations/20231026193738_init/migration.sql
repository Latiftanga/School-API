-- CreateTable
CREATE TABLE "users" (
    "id" SERIAL NOT NULL,
    "email" VARCHAR(255) NOT NULL,
    "password" VARCHAR(255) NOT NULL,
    "salt" TEXT NOT NULL,
    "role" TEXT,
    "active" BOOLEAN NOT NULL DEFAULT true,

    CONSTRAINT "users_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "students" (
    "admission_id" TEXT NOT NULL,
    "admission_date" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "firstname" VARCHAR(255) NOT NULL,
    "othernames" VARCHAR(255) NOT NULL,
    "gender" VARCHAR(1) NOT NULL,
    "date_of_birth" TIMESTAMP(3) NOT NULL,
    "phone" TEXT,
    "address" TEXT NOT NULL,
    "city" TEXT NOT NULL,
    "region" TEXT NOT NULL,
    "account_id" INTEGER,
    "image" VARCHAR(255),
    "active" BOOLEAN NOT NULL DEFAULT true,

    CONSTRAINT "students_pkey" PRIMARY KEY ("admission_id")
);

-- CreateIndex
CREATE UNIQUE INDEX "users_email_key" ON "users"("email");

-- CreateIndex
CREATE UNIQUE INDEX "students_admission_id_key" ON "students"("admission_id");

-- CreateIndex
CREATE UNIQUE INDEX "students_account_id_key" ON "students"("account_id");

-- AddForeignKey
ALTER TABLE "students" ADD CONSTRAINT "students_account_id_fkey" FOREIGN KEY ("account_id") REFERENCES "users"("id") ON DELETE SET NULL ON UPDATE CASCADE;
