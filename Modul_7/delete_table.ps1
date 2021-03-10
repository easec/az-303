# Kommer att ta bort table

$StorageAccountKey = "<storagekey>"
$Ctx = New-AzureStorageContext –StorageAccountName $StorageAccountName -StorageAccountKey $StorageAccountKey 
$TableName = "easecbooks"
