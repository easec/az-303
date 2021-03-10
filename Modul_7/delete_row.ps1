# Plockar bort första posten!


$StorageAccountName = "easecbook" 
 

$StorageAccountKey = "<storagekey>"
$Ctx = New-AzureStorageContext –StorageAccountName $StorageAccountName -StorageAccountKey $StorageAccountKey  

#Retrieve the table. 
$TableName = "easecbooks" 
$table = Get-AzureStorageTable -Name $TableName -Context $Ctx -ErrorAction Ignore 

#If the table exists, start deleting its entities. 
if ($table -ne $null) { 
   #Together the PartitionKey and RowKey uniquely identify every   
   #entity within a table.
	
   $tableResult = $table.CloudTable.Execute(
      [Microsoft.WindowsAzure.Storage.Table.TableOperation]::Retrieve(“Partition1”, "Row1")) 
		
   $entity = $tableResult.Result;
	
   if ($entity -ne $null) {
      $table.CloudTable.Execute(
         [Microsoft.WindowsAzure.Storage.Table.TableOperation]::Delete($entity)) 
   } 
}
