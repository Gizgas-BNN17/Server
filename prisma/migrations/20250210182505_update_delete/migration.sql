-- DropForeignKey
ALTER TABLE `productoncard` DROP FOREIGN KEY `ProductOnCard_cardId_fkey`;

-- DropForeignKey
ALTER TABLE `productoncard` DROP FOREIGN KEY `ProductOnCard_productId_fkey`;

-- DropIndex
DROP INDEX `ProductOnCard_cardId_fkey` ON `productoncard`;

-- DropIndex
DROP INDEX `ProductOnCard_productId_fkey` ON `productoncard`;

-- AddForeignKey
ALTER TABLE `ProductOnCard` ADD CONSTRAINT `ProductOnCard_cardId_fkey` FOREIGN KEY (`cardId`) REFERENCES `Card`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `ProductOnCard` ADD CONSTRAINT `ProductOnCard_productId_fkey` FOREIGN KEY (`productId`) REFERENCES `Product`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;
