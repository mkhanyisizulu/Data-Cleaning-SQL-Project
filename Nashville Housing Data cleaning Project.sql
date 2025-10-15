--NashVille Housing Data Cleaning Project

-- Project Breakdown


Select *
From portproject2.dbo.NashvilleHousing;

-- 1.Standardise date format

Select SaleDateConverted, CONVERT(Date,SaleDate)
From portproject2.dbo.NashvilleHousing;

UPDATE NashvilleHousing
SET SaleDate = CONVERT(Date,SaleDate);

ALTER TABLE NashvilleHousing
ADD SaleDateConverted Date;

UPDATE NashvilleHousing 
SET SaleDateConverted = CONVERT(Date,SaleDate);



---------------------------------------------------------------------------------------

-- 2.Populate property address data

Select *
From portproject2.dbo.NashvilleHousing
ORDER BY ParcelID;


Select a.ParcelID, a.PropertyAddress, b.ParcelID, b.PropertyAddress, ISNULL(a.PropertyAddress, b.PropertyAddress)
From portproject2.dbo.NashvilleHousing a
JOIN portproject2.DBO.NashvilleHousing b
	on a.ParcelID = b.ParcelID
	AND a.[UniqueID ] <> b.[UniqueID ]
Where a.PropertyAddress IS NULL

UPDATE a
SET PropertyAddress = ISNULL(a.PropertyAddress, b.PropertyAddress)
From portproject2.dbo.NashvilleHousing a
JOIN portproject2.DBO.NashvilleHousing b
	on a.ParcelID = b.ParcelID
	AND a.[UniqueID ] <> b.[UniqueID ]
Where a.PropertyAddress IS NULL



---------------------------------------------------------------------------------------

-- 3.Break out Address into individual columns( address, city, state)


Select PropertyAddress
From portproject2.dbo.NashvilleHousing;

SELECT 
SUBSTRING(PropertyAddress, 1, CHARINDEX(',', PropertyAddress) -1 ) AS Address
, SUBSTRING(PropertyAddress, CHARINDEX(',', PropertyAddress) +1 , LEN(propertyaddress)) AS Address
From portproject2.dbo.NashvilleHousing;


ALTER TABLE NashvilleHousing
ADD PropertySplitAddress Nvarchar(255);

UPDATE NashvilleHousing 
SET PropertySplitAddress = SUBSTRING(PropertyAddress, 1, CHARINDEX(',', PropertyAddress) -1 );



ALTER TABLE NashvilleHousing
ADD PropertySplitCity Nvarchar(255);

UPDATE NashvilleHousing 
SET PropertySplitCity = SUBSTRING(PropertyAddress, CHARINDEX(',', PropertyAddress) +1 , LEN(propertyaddress));

Select *
From portproject2.dbo.NashvilleHousing;



Select OwnerAddress
From portproject2.dbo.NashvilleHousing;

Select
PARSENAME(REPLACE(OwnerAddress,',','.'), 3)
, PARSENAME(REPLACE(OwnerAddress,',','.'), 2)
, PARSENAME(REPLACE(OwnerAddress,',','.'), 1)
From portproject2.dbo.NashvilleHousing;


ALTER TABLE NashvilleHousing
ADD OwnerSplitAddress Nvarchar(255);

UPDATE NashvilleHousing 
SET OwnerSplitAddress = PARSENAME(REPLACE(OwnerAddress,',','.'), 3);

--


ALTER TABLE NashvilleHousing
ADD OwnerSplitCity Nvarchar(255);

UPDATE NashvilleHousing 
SET OwnerSplitCity = PARSENAME(REPLACE(OwnerAddress,',','.'), 2);

--


ALTER TABLE NashvilleHousing
ADD OwnerSplitState Nvarchar(255);

UPDATE NashvilleHousing 
SET OwnerSplitState = PARSENAME(REPLACE(OwnerAddress,',','.'), 1);



Select *
From portproject2.dbo.NashvilleHousing;


----------------------------------------------------------------------------------------

-- 4. Change Y and N to YES and NO in "Sold as vacant" field

Select DISTINCT(SoldAsVacant), COUNT(SoldAsVacant)
From portproject2.dbo.NashvilleHousing
Group by SoldAsVacant
Order by 2;


Select SoldAsVacant
, CASE When SoldAsVacant = 'Y' THEN 'Yes'
	   When SoldAsVacant = 'N' THEN 'No'
	   ELSE SoldAsVacant
	   END
From portproject2.dbo.NashvilleHousing




UPDATE portproject2.dbo.NashvilleHousing
SET SoldAsVacant = CASE 
	   When SoldAsVacant = 'Y' THEN 'Yes'
	   When SoldAsVacant = 'N' THEN 'No'
	   ELSE SoldAsVacant
	   END


---------------------------------------------------------------------------------------

-- 5. Remove Duplicates


WITH RowNumCTE AS(
Select *,
	ROW_NUMBER() OVER(
	PARTITION BY ParcelID,
				 PropertyAddress,
				 SalePrice,
				 SaleDate,
				 LegalReference
				 ORDER BY
				 UniqueID
				 ) AS row_num
From portproject2.dbo.NashvilleHousing
--ORDER BY ParcelID
)
select *
From RowNumCTE
Where row_num > 1;

Select *
From portproject2.dbo.NashvilleHousing



---------------------------------------------------------------------------------------

-- 6.Delete Unused columns


Select *
From portproject2.dbo.NashvilleHousing

ALTER TABLE portproject2.dbo.NashvilleHousing
DROP COLUMN OwnerAddress, TaxDistrict, PropertyAddress;


ALTER TABLE portproject2.dbo.NashvilleHousing
DROP COLUMN SaleDate;

----------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------


