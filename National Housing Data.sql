

Select * from PortfolioProject..[National housing]

--standardize the data

select SaleDateConverted,CONVERT(Date,SaleDate)
from PortfolioProject..[National housing]

update [National housing]
SET SaleDate=CONVERT(Date,SaleDate)

ALTER TABLE [National housing]
ADD SaleDateConverted Date

update [National housing]
SET SaleDateConverted=CONVERT(Date,SaleDate)

--populate the property address
select PropertyAddress from PortfolioProject..[National housing]

select * from PortfolioProject..[National housing]
--where PropertyAddress is null
order by parcelID

select a.ParcelID , b.ParcelID,a.PropertyAddress,b.PropertyAddress,
ISNULL(a.PropertyAddress,b.PropertyAddress)
from PortfolioProject..[National housing] a
JOIN  PortfolioProject..[National housing] b
ON a.ParcelID = b.ParcelID
and  a.[UniqueID ] <> b.[UniqueID ]
where a.PropertyAddress is null

update a 
SET PropertyAddress = ISNULL(a.PropertyAddress,b.PropertyAddress)
from PortfolioProject..[National housing] a
JOIN  PortfolioProject..[National housing] b
ON a.ParcelID = b.ParcelID
and  a.[UniqueID ] <> b.[UniqueID ]
where a.PropertyAddress is null

--breaking out Adddress into individual columns(Address,City,State)

select PropertyAddress  from PortfolioProject..[National housing]
--where PropertyAddress is null
--order by parcelID

select 
SUBSTRING(PropertyAddress,1,CHARINDEX(',',PropertyAddress) -1) as Address
,SUBSTRING(PropertyAddress,CHARINDEX(',',PropertyAddress)+1,LEN(PropertyAddress))as LENGTH
   from PortfolioProject..[National housing]

  DROP TABLE IF EXISTS  PropertySplitAddress;
   ALTER TABLE PortfolioProject..[National housing]
ADD PropertySplitAddress1 nvarchar(255);

 update  PortfolioProject..[National housing]
SET PropertySplitAddress1 = SUBSTRING(PropertyAddress,1,CHARINDEX(',',PropertyAddress)-1)

   ALTER TABLE PortfolioProject..[National housing]
ADD PropertySplitCity nvarchar(255);

 update  PortfolioProject..[National housing]
SET PropertySplitCity = SUBSTRING(PropertyAddress,CHARINDEX(',',PropertyAddress) +1)

Select *
from PortfolioProject..[National housing]

select 
Parsename(REPLACE(OwnerAddress,',','.'),3),
Parsename(REPLACE(OwnerAddress,',','.'),2),
Parsename(REPLACE(OwnerAddress,',','.'),1)
from PortfolioProject..[National housing] 

  ALTER TABLE PortfolioProject..[National housing]
ADD OwnerSplitAddress nvarchar(255);

 update  PortfolioProject..[National housing]
SET OwnerSplitAddress = Parsename(REPLACE(OwnerAddress,',','.'),3)

  ALTER TABLE PortfolioProject..[National housing]
ADD OwnerState nvarchar(255);

  update  PortfolioProject..[National housing]
SET OwnerState = Parsename(REPLACE(OwnerAddress,',','.'),1)

  ALTER TABLE PortfolioProject..[National housing]
ADD OwnerSplitCity nvarchar(255);

 update  PortfolioProject..[National housing]
SET OwnerSplitCity = Parsename(REPLACE(OwnerAddress,',','.'),2)

  Select OwnerSplitCity,OwnerState,OwnerSplitAddress
from PortfolioProject..[National housing]

--Change Y and N to Yes and No to 'Sold as Vacant' field
select distinct SoldAsVacant,count( SoldAsVacant)
from PortfolioProject..[National housing]
group by SoldAsVacant
order by 2

select SoldAsVacant
,CASE when SoldAsVacant ='Y' THEN 'Yes'
       when SoldAsVacant ='N' THEN 'No'
       else SoldAsVacant

update [National housing]
       END
       from PortfolioProject..[National housing]
SET SoldAsVacant = CASE when SoldAsVacant ='Y' THEN 'Yes'
       when SoldAsVacant ='N' THEN 'No'
       else SoldAsVacant
       END
       from PortfolioProject..[National housing]

       --Remove duplicates
       with RowNumCTE as(
       Select *, row_number() over(partition by parcelID,
       PropertyAddress,
       SalePrice,
       SaleDate,
       LegalReference
       ORDER BY UniqueID
       ) row_num
       from PortfolioProject..[National housing]
       )
       select * from 
      RowNumCTE 
      where row_num >1
      order by PropertyAddress
      
      --delete unwanted columns
     select * from PortfolioProject..[National housing]

     ALTER TABLE PortfolioProject..[National housing]
     DROP COLUMN PropertyAddress,TaxDistrict,
     PropertySplitAddress,OwnerAddress,SaleDate
     