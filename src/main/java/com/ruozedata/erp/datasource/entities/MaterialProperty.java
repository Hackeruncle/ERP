package com.ruozedata.erp.datasource.entities;

public class MaterialProperty {
    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column ruozedata_materialproperty.id
     *
     * @mbggenerated
     */
    private Long id;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column ruozedata_materialproperty.nativeName
     *
     * @mbggenerated
     */
    private String nativename;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column ruozedata_materialproperty.enabled
     *
     * @mbggenerated
     */
    private Boolean enabled;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column ruozedata_materialproperty.sort
     *
     * @mbggenerated
     */
    private String sort;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column ruozedata_materialproperty.anotherName
     *
     * @mbggenerated
     */
    private String anothername;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column ruozedata_materialproperty.delete_Flag
     *
     * @mbggenerated
     */
    private String deleteFlag;

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column ruozedata_materialproperty.id
     *
     * @return the value of ruozedata_materialproperty.id
     *
     * @mbggenerated
     */
    public Long getId() {
        return id;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column ruozedata_materialproperty.id
     *
     * @param id the value for ruozedata_materialproperty.id
     *
     * @mbggenerated
     */
    public void setId(Long id) {
        this.id = id;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column ruozedata_materialproperty.nativeName
     *
     * @return the value of ruozedata_materialproperty.nativeName
     *
     * @mbggenerated
     */
    public String getNativename() {
        return nativename;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column ruozedata_materialproperty.nativeName
     *
     * @param nativename the value for ruozedata_materialproperty.nativeName
     *
     * @mbggenerated
     */
    public void setNativename(String nativename) {
        this.nativename = nativename == null ? null : nativename.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column ruozedata_materialproperty.enabled
     *
     * @return the value of ruozedata_materialproperty.enabled
     *
     * @mbggenerated
     */
    public Boolean getEnabled() {
        return enabled;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column ruozedata_materialproperty.enabled
     *
     * @param enabled the value for ruozedata_materialproperty.enabled
     *
     * @mbggenerated
     */
    public void setEnabled(Boolean enabled) {
        this.enabled = enabled;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column ruozedata_materialproperty.sort
     *
     * @return the value of ruozedata_materialproperty.sort
     *
     * @mbggenerated
     */
    public String getSort() {
        return sort;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column ruozedata_materialproperty.sort
     *
     * @param sort the value for ruozedata_materialproperty.sort
     *
     * @mbggenerated
     */
    public void setSort(String sort) {
        this.sort = sort == null ? null : sort.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column ruozedata_materialproperty.anotherName
     *
     * @return the value of ruozedata_materialproperty.anotherName
     *
     * @mbggenerated
     */
    public String getAnothername() {
        return anothername;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column ruozedata_materialproperty.anotherName
     *
     * @param anothername the value for ruozedata_materialproperty.anotherName
     *
     * @mbggenerated
     */
    public void setAnothername(String anothername) {
        this.anothername = anothername == null ? null : anothername.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column ruozedata_materialproperty.delete_Flag
     *
     * @return the value of ruozedata_materialproperty.delete_Flag
     *
     * @mbggenerated
     */
    public String getDeleteFlag() {
        return deleteFlag;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column ruozedata_materialproperty.delete_Flag
     *
     * @param deleteFlag the value for ruozedata_materialproperty.delete_Flag
     *
     * @mbggenerated
     */
    public void setDeleteFlag(String deleteFlag) {
        this.deleteFlag = deleteFlag == null ? null : deleteFlag.trim();
    }
}